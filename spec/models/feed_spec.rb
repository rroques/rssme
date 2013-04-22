require 'spec_helper'

describe Feed do

  let(:user) { FactoryGirl.create(:user)}

  before(:each) do
    @attr = { 
      :name => "name", 
      :url => "http://domain.com/file.rss"
    }
    @feed = user.feeds.new(@attr)
  end

  subject { @feed }

  it { should respond_to(:name) }
  it { should respond_to(:url) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }


  it 'user should not be accessible via mass assignment' do 
    expect{Feed.create( 
      :name => "name", 
      :url => "http://domain.com/file.rss",
      :user => user
    )}.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  end 

  describe 'validation' do
    it 'should validate presence name' do
      feed = user.feeds.new({:url => 'http://bla.com/rss'})
      feed.should_not be_valid  
    end  
    it 'should validate presence url' do
      feed = user.feeds.new({:name => 'name'})
      feed.should_not be_valid  
    end  
    it 'should validate format url' do
      feed = user.feeds.new({:name => 'name', :url =>'url'})
      feed.should_not be_valid  
    end  
  end
  
end
