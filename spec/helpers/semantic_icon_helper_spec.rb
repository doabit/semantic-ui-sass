require 'spec_helper'

describe SemanticIconHelper do
  it "render icon with name" do
    expect(semantic_icon('archive')).to eq '<i class="archive icon"></i>'
  end

  it "render icon with names" do
    expect(semantic_icon('add sign')).to eq '<i class="add sign icon"></i>'
  end
end