FactoryGirl.define do

  factory :user do
    email {"user_#{rand(1000).to_s}@example.com" }
    password "password"
  end

end
