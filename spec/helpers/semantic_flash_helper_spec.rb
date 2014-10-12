require 'spec_helper'

describe SemanticFlashHelper do
  describe "semantic_flash" do

    it "should return warning flash message" do
      should_receive(:flash).and_return({warning: "Update Warning!"})
      expect(semantic_flash).to eq '<div class="ui warning message"><i class="close icon"></i>Update Warning!</div>'
    end

    it "should return alert-success message when using notice message" do
      should_receive(:flash).and_return({:notice => "Update Success!"})
      expect(semantic_flash).to eq '<div class="ui success message"><i class="close icon"></i>Update Success!</div>'
    end

    it "should return error message when using notice alert" do
      should_receive(:flash).and_return({:alert => "Update Failed!"})
      expect(semantic_flash).to eq '<div class="ui error message"><i class="close icon"></i>Update Failed!</div>'
    end

    it "should return alert-error message when using notice error" do
      should_receive(:flash).and_return({:error => "Update Failed!"})
      expect(semantic_flash).to eq '<div class="ui error message"><i class="close icon"></i>Update Failed!</div>'
    end

    it "should return no message when using an undefined message" do
      should_receive(:flash).and_return({:undefined => "Update Undefined!"})
      semantic_flash.should == ""
    end

    it "should return no message when the message is blank" do
      should_receive(:flash).and_return({:notice => ""})
      semantic_flash.should == ""
    end
  end
end
