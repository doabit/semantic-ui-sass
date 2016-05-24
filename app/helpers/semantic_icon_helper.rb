module SemanticIconHelper
  def semantic_icon(*names)
    opts = names[-1].is_a?(Hash) ? names.delete_at(-1) : {}
    icon_classes = names.map{|name| "#{name.to_s.gsub('_','-')}" } << 'icon'
    opts[:class] = [opts[:class], icon_classes].flatten.reject(&:nil?)
    content_tag :i, nil, opts
  end
end
