require 'spec_helper'

describe Sub do

  it "requires a moderator" do
    expect(FactoryGirl.build(:sub, :mod_id => "", :sub_name => "50/50")).to_not be_valid
  end

  it "requires a sub name" do
    expect(FactoryGirl.build(:sub, :mod_id => 1, :sub_name => "")).to_not be_valid
  end

  it "has a moderator and name" do
    expect(FactoryGirl.build(:sub, :mod_id => 1, :sub_name => "50/50")).to be_valid
  end

  it "belongs to a mod" do
    user = new_user
    sub = new_sub(user)
    expect(sub.moderator).to eq(user)
  end

  it "has many links" do
    sub = new_sub
    link = new_link(sub)
    expect(sub.links.first).to eq(link)
  end

  xit "has many users" do
  end

  xit "has many comments" do
  end
end
