require 'spec_helper'

describe User do
  describe "validations" do
    it "validates uniqueness of username" do
      user1 = Factory.create(:user)
      user2 = Factory.build(:user, username: user1.username)
      user2.should_not be_valid
    end

    it "validates uniqueness of email" do
      user1 = Factory.create(:user)
      user2 = Factory.build(:user, email: user1.email)
      user2.should_not be_valid
    end

    it "validates presence of username" do
      user = Factory.build(:user, username: nil)
      user.should_not be_valid
    end

    it "validates presence of password" do
      user = Factory.build(:user, password: nil)
      user.should_not be_valid
    end

    it "validates presence of email" do
      user = Factory.build(:user, email: nil)
      user.should_not be_valid
    end

    it "validates the format of username" do
      user = Factory.build(:user, username: '!@#$name')
      user.should_not be_valid
    end
  end

  it "should create a user" do
    user = Factory.create(:user)
    user.should be_valid
  end
end
