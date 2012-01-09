require 'spec_helper'

describe Event do
  describe "validations" do
    it "validates the presence of name" do
      event = Factory.build(:event, name: nil)
      event.should_not be_valid
    end
  end
end
