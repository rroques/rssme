require 'spec_helper'

describe Item do

  # executed once and for all
  let(:feed) { FactoryGirl.create(:feed)}

  before(:each) do
  	@valid_items_attr = {:title => 'title', :content => 'content', :pub_date =>  DateTime.now} 
  	@item = feed.items.new(@valid_items_attr)
  end

  subject { @item }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:feed_id) }
  it { should respond_to(:pub_date) }
  its(:feed) { should == feed }

  it { should be_valid }

  it 'feed should not be accessible via mass assignment' do 
  	expect{ feed.items.new( {:feed_id => 1, :title => 'title', :content => 'content', :pub_date =>  DateTime.now})}.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  end 

  describe 'validation' do
    it 'should validate OK' do
     item = feed.items.new(@valid_items_attr)
     item.should be_valid  
   end  
   it 'should validate presence title' do
     @valid_items_attr.delete(:title)
     item = feed.items.new(@valid_items_attr)
     item.should_not be_valid  
     item.errors.messages[:title].should include("can't be blank")
   end  
   it 'should validate presence content' do
     @valid_items_attr.delete(:content)
     item = feed.items.new(@valid_items_attr)
     item.should_not be_valid  
     item.errors.messages[:content].should include("can't be blank")
   end  
   it 'should validate presence pub_date' do
     @valid_items_attr.delete(:pub_date)
     item = feed.items.new(@valid_items_attr)
     item.should_not be_valid  
     item.errors.messages[:pub_date].should include("can't be blank")
   end  
 end
end
