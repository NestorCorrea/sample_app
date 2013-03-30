require 'spec_helper'

describe "Static pages" do

  # ===============================
  # Home page test
  # ===============================
  describe "Home page" do
    # Sample app text
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector("h1", :text => 'Sample App')
    end

    # Title
    it "should have the right title, 'Home'" do
      visit '/static_pages/home'
      page.should have_selector("title", :text => "Ruby on Rails Sample App | Home")
    end
  end

  # ===============================
  # Help page test
  # ===============================
  describe "Help page" do
    # Sample app text
    it "Should have the content 'Help me please'" do
      visit '/static_pages/help'
      page.should have_selector("h1", :text => 'Help me please')
    end

    # Title
    it "Should have the right title, 'Help'" do
      visit '/static_pages/help'
      page.should have_selector("title", :text => "Ruby on Rails Sample App | Help")
    end
  end

  # ===============================
  # About page tests
  # ===============================
  describe "About page" do
    # Sample app text
    it "Should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector("h1", :text => "About Us")
    end

    # Title
    it "should have the right title 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector("title" , :text => "Ruby on Rails Sample App | About Us")
    end
  end



  # ===============================
  # Contact Pagetest
  # ===============================
  describe "Contact page" do
    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector("h1", :text => "Contact us")
    end

    it "should have the right title 'Contact page'"do
      visit '/static_pages/contact'
      page.should have_selector("title", :text => "Ruby on Rails Sample App | Contact")
    end
  end
end