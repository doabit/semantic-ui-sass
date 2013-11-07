require File.dirname(__FILE__) + '/breadcrumbs.rb'
module Semantic
  module Ui
    module Sass
      module Rails
        class Engine < ::Rails::Engine
          initializer "semantic-ui-sass.assets.precompile" do |app|
            app.config.assets.precompile << %r(semantic-ui\/(basic\.)*icons\.(?:eot|svg|ttf|woff)$)
          end
          initializer 'semantic-ui-sass.setup_helpers' do |app|
            app.config.to_prepare do
              ActionController::Base.send :include, Semantic::Ui::Sass::BreadCrumbs
            end
          end
        end
      end
    end
  end
end
