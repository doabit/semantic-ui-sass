require 'spec_helper'

describe SemanticIconHelper do
  it "render icon with name" do
    expect(semantic_icon('add')).to eq '<i class="add icon"></i>'
  end

  it "render icon with names with string" do
    expect(semantic_icon('add sign')).to eq '<i class="add sign icon"></i>'
  end

  it "render icon with names with params" do
    expect(semantic_icon('add', 'sign')).to eq '<i class="add sign icon"></i>'
  end

  it "render icon with names with sym params" do
    expect(semantic_icon(:add, :sign)).to eq '<i class="add sign icon"></i>'
  end

end