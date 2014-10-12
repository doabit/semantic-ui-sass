require 'spec_helper'

describe SemanticFlashHelper do
  describe "semantic_flash" do

    it "should return warning flash message" do
      @request.flash[:warning] = "Update Warning!"
      expect(semantic_flash).to eq '<div class="ui warning message"><i class="close icon"></i>Update Warning!</div>'
    end

    it "should return alert-success message when using notice message" do
      @request.flash[:notice] = "Update Success!"
      expect(semantic_flash).to eq '<div class="ui success message"><i class="close icon"></i>Update Success!</div>'
    end

    it "should return error message when using notice alert" do
      @request.flash[:alert] = "Update Failed!"
      expect(semantic_flash).to eq '<div class="ui error message"><i class="close icon"></i>Update Failed!</div>'
    end

    it "should return alert-error message when using notice error" do
      @request.flash[:error] = "Update Failed!"
      expect(semantic_flash).to eq '<div class="ui error message"><i class="close icon"></i>Update Failed!</div>'
    end

    it "should return no message when using an undefined message" do
      @request.flash[:undefined] = "Update Undefined!"
      expect(semantic_flash).to eq ""
    end

    it "should return no message when the message is blank" do
      @request.flash[:notice] = ""
      expect(semantic_flash).to eq ""
    end
  end
end
