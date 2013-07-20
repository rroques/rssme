require 'spec_helper'

describe ReadItem do
 
  before(:each) do
    @valid_attr = {:feed_id => 1, :item_id => 2} 
    @read_item = ReadItem.new(@valid_attr)
  end

  subject { @read_item }

  it { should be_valid }

  it 'item_id shold be compulsory' do 
    read_item = ReadItem.new({:feed_id => 1})
    read_item.should_not be_valid  
    read_item.errors.messages[:item_id].should include("can't be blank")
  end

  it 'feed_id shold be compulsory' do 
    read_item = ReadItem.new({:item_id => 1})
    read_item.should_not be_valid  
    read_item.errors.messages[:feed_id].should include("can't be blank")
  end 

end
