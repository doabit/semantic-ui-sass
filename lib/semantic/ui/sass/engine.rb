module Semantic
  module Ui
    module Sass
      module Rails
        class Engine < ::Rails::Engine
          initializer "semantic-ui-sass.assets.precompile" do |app|
            app.config.assets.precompile << %r(semantic-ui\/(basic\.)*icons\.(?:eot|svg|ttf|woff)$)
          end
        end
      end
    end
  end
end
