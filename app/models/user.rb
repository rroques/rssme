class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :email, :password, :feeds

  has_many :feeds, :dependent => :destroy
end
