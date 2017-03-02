description "Semantic UI for Sass"

# Stylesheet importing semantic
stylesheet 'styles.scss'

# Other Semantic UI assets
basedir = '../../app/assets'
image_dir = "#{basedir}/images/semantic-ui"
javascript_dir = ["#{basedir}/javascripts/semantic-ui", "#{basedir}/javascripts/semantic-ui/behavior"]
font_dir = "#{basedir}/fonts/semantic-ui"


Dir[File.join(File.dirname(__FILE__), image_dir, '*.png')].each do |file|
  filename = File.basename(file)
  image "#{image_dir}/#{filename}", to: "semantic-ui/#{filename}"
end

javascript_dir.each do |dir|
  Dir[File.join(File.dirname(__FILE__), dir, '*.js')].each do |file|
    filename = File.basename(file)
    to_path = dir.include?('behavior') ? "semantic-ui/behavior/#{filename}" : "semantic-ui/#{filename}"
    javascript "#{dir}/#{filename}", to: to_path
  end
end

Dir[File.join(File.dirname(__FILE__), font_dir, '*')].each do |file|
  filename = File.basename(file)
  font "#{font_dir}/#{filename}", to: "semantic-ui/#{filename}"
end
