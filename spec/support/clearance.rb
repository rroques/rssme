require 'clearance/testing'


def login_via_post
  user = FactoryGirl.create(:user)
  post_via_redirect session_path, 'session[email]' => user.email, 'session[password]' => user.password 
end

def login
  user = FactoryGirl.create(:user)
  visit root_path
  fill_in 'Email', :with => user.email
  fill_in 'Password', :with => user.password
  click_button 'Sign in'
  page.should have_content 'Sign out'
  find('#current_user').should have_content(user.email)
end
