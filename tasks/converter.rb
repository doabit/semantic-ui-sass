require 'open-uri'
require 'json'
require 'fileutils'

class Converter

  def initialize
    @branch_sha = get_tree_sha
    @paths = ['collections', 'elements', 'views', 'modules']
    @save_at    = { js: 'app/assets/javascripts/semantic-ui',
                    scss: 'app/assets/stylesheets/semantic-ui',
                    images: 'app/assets/images/semantic-ui',
                    fonts: 'app/assets/fonts/semantic-ui' }
  end

  def process
    process_stylesheets_assets
    process_javascript_assets
    process_images_and_fonts_assets
    store_version
  end

  def process_stylesheets_assets
    main_content = ''
     get_less_paths.each do |path, sha|
      content = ''
      get_less_files(sha).each do |name|
        file_name = name.gsub('.less', '')

        if name.include?('.less') && @paths.include?(path)
          file = open_git_file("https://raw.github.com/jlukic/Semantic-UI/master/src/#{path}/#{name}")
          file = convert(file)
          save_file(name, file, path)
          content += "@import '#{file_name}';\n"
        end

      end

      if @paths.include?(path)
         save_file('all', content, path)
         main_content += "@import 'semantic-ui/#{path}/all';\n";
      end
    end
    file = "app/assets/stylesheets/semantic-ui.scss"
    f = File.open(file, "w+")
    f.write(main_content)
    f.close
  end

  def process_javascript_assets
     get_less_paths.each do |path, sha|
      content = ''
      get_less_files(sha).each do |name|
        file_name = name.gsub('.js', '')
        # Copy javascripts
        if path == 'modules' && name.include?('.js')
          file = open_git_file("https://raw.github.com/jlukic/Semantic-UI/master/src/#{path}/#{name}")
          save_file(name, file, path, 'js')
          content += "//= require semantic-ui/#{file_name}\n"
        end
      end
      if path == 'modules'
        file = "app/assets/javascripts/semantic-ui.js"
        f = File.open(file, "w+")
        f.write(content)
        f.close
      end
    end
  end

  def process_images_and_fonts_assets
     get_less_paths.each do |path, sha|

      get_less_files(sha).each do |name|
        file_name = name.gsub('.less', '')
        if path == 'images' || path == 'fonts'
          file = open_git_file("https://raw.github.com/jlukic/Semantic-UI/master/src/#{path}/#{name}")
          save_file(name, file, path, path)
        end
      end
    end

  end


private

  # Get the sha of less branch
  def get_tree_sha
    sha = nil
    trees = open('https://api.github.com/repos/jlukic/Semantic-UI/git/trees/master').read
    trees = JSON.parse trees
    trees['tree'].find{|t| t['path'] == 'src'}['sha']
  end

  def get_less_paths
    paths = open("https://api.github.com/repos/jlukic/Semantic-UI/git/trees/#{get_tree_sha}").read
    paths = JSON.parse paths
    paths['tree'].select{|f| f['type'] == 'tree' }.map{|f| [f['path'], f['sha']] }
  end

  def get_less_files(sha)
    files = open("https://api.github.com/repos/jlukic/Semantic-UI/git/trees/#{sha}").read
    files = JSON.parse files
    files['tree'].select{|f| f['type'] == 'blob' }.map{|f| f['path'] }
  end


  def convert(file)
    file = replace_interpolation(file)
    file = replace_vars(file)
    file = replace_fonts(file)
    # file = replace_font_family(file)
    file = replace_fonts_url(file)
    file = replace_grads(file)
    file = replace_mixins(file)
    file = replace_less_extend(file)
    file = replace_includes(file)
    file = replace_spin(file)
    file = replace_opacity(file)
    file = replace_image_urls(file)
    file = replace_image_paths(file)
    file = replace_escaping(file)

    file
  end

  def open_git_file(file)
    open(file).read
  end

  def save_file(name, content, path, type='stylesheets')
    case type
    when 'stylesheets'
      name = name.gsub(/\.less/, '')
      file = "#{@save_at[:scss]}/#{path}/_#{name}.scss"
    when 'js', 'images', 'fonts'
      name = name
      file = "#{@save_at[type.to_sym]}/#{name}"
    end
    dir = File.dirname(file)
    unless File.directory?(file)
      FileUtils.mkdir_p(dir)
    end
    f = File.open(file, "w+")
    f.write(content)
    f.close
    puts "Saved #{name}\n"
  end

  def store_version
    path = 'lib/semantic/ui/sass/version.rb'
    content = File.read(path).sub(/SEMANTIC_UI_SHA\s*=\s*['"][\w]+['"]/, "SEMANTIC_UI_SHA = '#@branch_sha'")
    File.open(path, 'w') { |f| f.write(content) }
  end

  def replace_interpolation(less)
    less.gsub(/@{([^}]+)}/, '#{$\1}')
  end

  def replace_vars(less)
    less = less.dup
    # skip header comment
    less =~ %r(\A/\*(.*?)\*/)m
    from = $~ ? $~.to_s.length : 0
    less[from..-1] = less[from..-1].
        gsub(/(?!@mixin|@media|@page|@keyframes|@font-face|@-\w)@/, '$').
        # variables that would be ignored by gsub above: e.g. @page-header-border-color
        gsub(/@(page[\w-]+)/, '$\1')
    less
  end

  def fix_progress_bar(less)
    less = less.gsub(/(\$)(-webkit-keyframes progress-bar-stripes)/, '@\2')
    less = less.gsub(/(\$)(-moz-keyframes)/, '@\2')
    less = less.gsub(/(\$)(keyframes progress-bar-stripes)/, '@\2')
  end

  def replace_fonts(less)
    less.gsub(/#font \> \.([\w-]+)/, '@include ctb-font-\1')
  end

  def replace_fonts_url(less)
    less.gsub(/url\(\.\.\/fonts\/?(.*?)\)/) {|s| "font-url(\"semantic-ui/#{$1}\")" }
  end

  def replace_font_family(less)
    less.gsub(/#font \> #family \> \.([\w-]+)/, '@include ctb-font-family-\1')
  end

  def replace_grads(less)
    less.gsub(/#gradient \> \.([\w-]+)/, '@include ctb-gradient-\1')
  end

  def replace_mixins(less)
    less.gsub(/^\.([\w-]*)(\(.*\))([\s\{]+)$/, '@mixin \1\2\3')
  end

  def replace_includes(less)
    less.gsub(/\.([\w-]*)(\(.*\));?/, '@include ctb-\1\2;')
  end

  def replace_less_extend(less)
    less.gsub(/\#(\w+) \> \.([\w-]*)(\(.*\));?/, '@include ctb-\1-\2\3;')
  end

  def replace_spin(less)
    less.gsub(/spin/, 'adjust-hue')
  end

  def replace_opacity(scss)
    scss.gsub(/\@include opacity\((\d+)\)/) {|s| "@include ctb-opacity(#{$1.to_f / 100})"}
  end

  def replace_image_urls(less)
    less.gsub(/url\("?(.*?).gif"?\)/) {|s| "image-url(\"#{$1}.gif\")" }
  end

  def replace_image_paths(less)
    less.gsub('../images/', 'semantic-ui/')
  end

  def replace_escaping(less)
    less = less.gsub(/\~"([^"]+)"/, '#{\1}') # Get rid of ~ escape
    less.gsub(/(\W)e\("([^\)]+)"\)/) {|s| "#{$1 if $1 != /\s/}#{$2}"} # Get rid of e escape
  end

  def insert_default_vars(scss)
    scss.gsub(/^(\$.+);$/, '\1 !default;')
  end

end

Converter.new.process