require 'spec_helper'

describe Feed do


  before(:each) do
    @attr = { 
      :name => "name", 
      :url => "http://domain.com/file.rss"
    }
  end

  it 'should create a new instance given valid attributes' do
    Feed.create!(@attr)
  end  

  describe 'validation' do
    it 'should validate presence name' do
      feed = Feed.new({:url => 'http://bla.com/rss'})
      feed.should_not be_valid  
    end  
    it 'should validate presence url' do
      feed = Feed.new({:name => 'name'})
      feed.should_not be_valid  
    end  
    it 'should validate format url' do
      feed = Feed.new({:name => 'name', :url =>'url'})
      feed.should_not be_valid  
    end  
  end
  
end
