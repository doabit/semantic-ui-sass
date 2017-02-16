module Semantic
  module Ui
    module Sass

      module BreadCrumbs
        def self.included(base)
          base.extend(ClassMethods)
        end

        module ClassMethods
          def semantic_breadcrumb(name, url, options = {})
            class_name = self.name
            before_action options do |controller|
              name = controller.send :translate_semantic_breadcrumb, name, class_name if name.is_a?(Symbol)
              controller.send :semantic_breadcrumb, name, url
            end
          end
        end

        protected

        def semantic_breadcrumb(name, url = '', options = {})
          @breadcrumbs ||= []
          name = translate_semantic_breadcrumb(name, self.class.name) if name.is_a?(Symbol)
          url = eval(url.to_s) if url =~ /_path|_url|@/
            @breadcrumbs << {:name => name, :url => url, :options => options}
        end

        def translate_semantic_breadcrumb(name, class_name)
          scope = [:breadcrumbs]
          namespace = class_name.underscore.split('/')
          namespace.last.sub!('_controller', '')
          scope += namespace

          I18n.t name, :scope => scope
        end
      end

    end
  end
end
