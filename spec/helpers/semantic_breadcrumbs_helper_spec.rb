require 'spec_helper'

describe SemanticBreadcrumbsHelper do
  describe "semantic_breadcrumbs" do

     it "should return breadcrumbs" do
       controller.instance_variable_set("@breadcrumbs", [{name: 'Home', url:'/'}])
       expect(semantic_breadcrumbs).to like_of %Q{
        <div class="ui breadcrumb">
         <div class="active section">Home</div>
        </div>
       }
     end

     it "should return breadcrumbs with multi params" do
       controller.instance_variable_set("@breadcrumbs", [{name: 'Home', url:'/'}, {name: 'Posts', url: '/posts'}])
       expect(semantic_breadcrumbs).to like_of %Q{
        <div class="ui breadcrumb">
          <a href="/">Home</a>
          <div class="divider">/</div>
          <div class="active section">Posts</div>
        </div>
      }
     end

     it "should return breadcrumbs with divider" do
       controller.instance_variable_set("@breadcrumbs", [{name: 'Home', url:'/'}, {name: 'Posts', url: '/posts'}])
       expect(semantic_breadcrumbs('>')).to like_of %Q{
        <div class="ui breadcrumb">
          <a href="/">Home</a>
          <div class="divider">&gt;</div>
          <div class="active section">Posts</div>
        </div>
      }
     end

   end
end
