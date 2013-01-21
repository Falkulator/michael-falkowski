require 'spec_helper'
require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email 'dude@aol.com'
    password 'password'
  end
end

describe "Logins" do
  describe "guest visits admin" do
    it "sees the guest admin page" do

      visit works_path
      page.should have_content 'Did you want'
    end
  end
  
  describe "user with wrong credentials" do
    it "user wont log in" do
    	visit new_user_session_path 
    	within("#new_user") do
			fill_in 'user_email', :with => 'user@example.com'
			fill_in 'user_password', :with => 'password'
    	end
    	click_button 'Sign in'
    	page.should have_content 'Sign in'
    end
  end
  
  describe "user login success" do
    it "user logs in" do
		user = FactoryGirl.create(:user)
    	visit new_user_session_path 
    	within("#new_user") do
			fill_in 'user_email', :with => user.email
			fill_in 'user_password', :with => user.password
    	end
    	click_button 'Sign in'
    	page.should have_xpath '/'
    end
  end
end
