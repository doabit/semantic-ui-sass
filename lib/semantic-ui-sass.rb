module Semantic
  module Ui
    module Sass
      class FrameworkNotFound < StandardError; end

      if defined?(::Rails)
        require 'semantic/ui/sass/engine'
      end

      if defined?(::Compass)
        base = File.join(File.dirname(__FILE__), '..')
        styles = File.join(base, 'app', 'assets', 'stylesheets')
        templates = File.join(base, 'templates')
        ::Compass::Frameworks.register('semantic-ui', :path => base, :stylesheets_directory => styles, :templates_directory => templates)
      end

      if !(defined?(::Rails) || defined?(::Compass))
        raise Semantic::Ui::Sass::FrameworkNotFound, "semantic-ui-sass requires either Rails > 3.1 or Compass, neither of which are loaded"
      end
    end
  end
end
