FactoryGirl.define do |n|
  
  factory :feed do 
    name 'feed name'
    url 'http://feed.com/rss/index.rss' 
    user
  end  

  factory :item do 
    title 'item name'
    content 'http://feed.com/rss/index.rss' 
    pub_date DateTime.now
    feed
  end  

end