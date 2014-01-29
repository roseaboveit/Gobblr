require 'spec_helper'

  describe "validations" do
    it "is valid" do
      expect(build(:user)).to be_valid
    end
  end