require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.create(:user)}

  before(:each) do
    @attr = { 
      :name => "name", 
      :url => "http://domain.com/file.rss"
    }
  end

  it 'should create feeds' do
    expect{user.feeds.create!(@attr)}.to change{Feed.count}.by(1)
  end  

  it 'deleting a user should delete its feeds' do
    user.feeds.create!(@attr)
    relationship = user.feeds
    user.destroy
    relationship.should be_empty
    relationship.present?.should be_false
  end  
  
  
end
