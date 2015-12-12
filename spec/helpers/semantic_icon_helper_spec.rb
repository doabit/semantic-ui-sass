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

  it "render icon with name and id" do
    expect(semantic_icon('add', id: 'id')).to eq '<i class="add icon" id="id"></i>'
  end

  it "render icon with names with string and id" do
    expect(semantic_icon('add sign', id: 'id')).to eq '<i class="add sign icon" id="id"></i>'
  end

  it "render icon with names with params and id" do
    expect(semantic_icon('add', 'sign', id: 'id')).to eq '<i class="add sign icon" id="id"></i>'
  end

  it "render icon with names with sym params and id" do
    expect(semantic_icon(:add, :sign, id: 'id')).to eq '<i class="add sign icon" id="id"></i>'
  end

end