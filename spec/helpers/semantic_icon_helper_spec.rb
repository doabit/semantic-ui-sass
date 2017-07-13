require 'spec_helper'

describe SemanticIconHelper do
  it "render icon with name" do
    render plain: semantic_icon('add')
    assert_select 'i[class="add icon"]'
  end

  it "render icon with names with string" do
    render plain: semantic_icon('add sign')
    assert_select 'i[class="add sign icon"]'
  end

  it "render icon with names with params" do
    render plain: semantic_icon('add', 'sign')
    assert_select 'i[class="add sign icon"]'
  end

  it "render icon with names with sym params" do
    render plain: semantic_icon(:add, :sign)
    assert_select 'i[class="add sign icon"]'
  end

  it "render icon with name and id" do
    render plain: semantic_icon('add', id: 'id')
    assert_select 'i[class="add icon"][id="id"]'
  end

  it "render icon with arbitrary attributes" do
    render plain: semantic_icon('add', id: 'id', data: {foo: 'bar'})
    assert_select 'i[class="add icon"][id="id"][data-foo="bar"]'
  end

  it "render icon with names with string and id" do
    render plain: semantic_icon('add sign', id: 'id')
    assert_select 'i[class="add sign icon"][id="id"]'
  end

  it "render icon with names with params and id" do
    render plain: semantic_icon('add', 'sign', id: 'id')
    assert_select 'i[class="add sign icon"][id="id"]'
  end

  it "render icon with names with sym params and id" do
    render plain: semantic_icon(:add, :sign, id: 'id')
    assert_select 'i[class="add sign icon"][id="id"]'
  end
end
