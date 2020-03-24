module Semantic
  module Ui
    module Sass
      class FrameworkNotFound < StandardError; end
      class << self
        def load!
          if defined?(::Rails)
            require 'semantic/ui/sass/engine'
          elsif defined?(::Compass)
            ::Compass::Frameworks.register('semantic-ui', :path => base, :stylesheets_directory => stylesheets_path, :templates_directory => templates_path)
          elsif defined?(::Sprockets)
            Sprockets.append_path(stylesheets_path)
            Sprockets.append_path(fonts_path)
            Sprockets.append_path(images_path)
            Sprockets.append_path(javascripts_path)
          end

          configure_sass
          if !(defined?(::Rails) || defined?(::Compass) || defined?(::Sprockets))
            raise Semantic::Ui::Sass::FrameworkNotFound, "semantic-ui-sass requires either Rails > 3.1 or Compass, or Sprockets, none of which are loaded"
          end
        end

        # Paths
        def gem_path
          @gem_path ||= File.expand_path('..', File.dirname(__FILE__))
        end

        def templates_path
          File.join(gem_path, 'templates')
        end

        def assets_path
          @assets_path ||= File.join(gem_path, 'app', 'assets')
        end

        def fonts_path
          File.join(assets_path, 'fonts')
        end

        def images_path
          File.join(assets_path, 'images')
        end

        def javascripts_path
          File.join(assets_path, 'javascripts')
        end

        def stylesheets_path
          File.join(assets_path, 'stylesheets')
        end

        def configure_sass
          require 'sassc'
          ::SassC.load_paths << stylesheets_path
        end

      end
    end
  end
end
Semantic::Ui::Sass.load!
