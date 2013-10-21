module SemanticIconHelper
  def semantic_icon(*names)
    content_tag :i, nil, class: names.map{|name| "#{name.to_s.gsub('_','-')}" } << 'icon'
  end
end