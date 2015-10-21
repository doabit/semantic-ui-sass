module SemanticBreadcrumbsHelper
  def semantic_breadcrumbs(divider = '/', &block)
    content = render :partial => 'semantic/breadcrumbs', :layout => false, :locals => { :divider => divider }
    if block_given?
      capture(content, &block)
    else
      content
    end
  end
end
