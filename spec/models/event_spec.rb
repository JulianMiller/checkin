require 'spec_helper'

describe Event do
  describe "validations" do
    it "validates the presence of name" do
      event = Factory.build(:event, name: nil)
      event.should_not be_valid
    end

    it "validates the presence of longitude & latitude" do
      event = Factory.build(:event, longitude: nil, latitude: nil)
      event.should_not be_valid
    end
  end
end
