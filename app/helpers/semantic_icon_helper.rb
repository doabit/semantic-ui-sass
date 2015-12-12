module SemanticIconHelper
  def semantic_icon(*names, id: nil)
    content_tag :i, nil, class: names.map{|name| "#{name.to_s.gsub('_','-')}" } << 'icon', id: id
  end
end