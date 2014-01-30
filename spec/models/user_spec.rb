require 'spec_helper'

describe User do
  it "validates presence of username" do
    expect(FactoryGirl.build(
      :user,
      :username => "",
      :password => "Some password")).not_to be_valid
  end


  it "validates presence of password" do
    expect(FactoryGirl.build(
      :user,
      :username => "Some Username",
      :password => "")).not_to be_valid
  end

  it "validates password is longer than 6 characters" do
    expect(FactoryGirl.build(
      :user,
      :username => "Ryan",
      :password => "1234")).not_to be_valid
  end

  it "validates a proper username and password" do
    expect(FactoryGirl.build(
      :user,
      :username => "Vishal",
      :password => "Correctpassword")).to be_valid
  end

  it "ensures that password is not stored" do
    user = new_user
    expect(User.find_by_username(user.username).password).should be_nil
  end

  it "has a session token" do
    user = new_user
    expect(User.find_by_username(user.username).session_token).should_not be_nil
  end

  it "finds by credentials when User exists" do
    user = new_user
    expect(User.find_by_credentials(user.username, "CorrectPassword")).should eq(user)
  end

  it "resets the session_token" do
    user = new_user
    original_token = user.session_token
    user.reset_session_token!
    expect(original_token).should_not eq(user.session_token)
  end
end
