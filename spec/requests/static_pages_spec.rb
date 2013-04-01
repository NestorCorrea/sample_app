require 'spec_helper'

describe "Static pages" do
  # Set the main subject for all the tests
  subject {page}


  # ===============================
  # Home page tests
  # ===============================
  describe "Home page" do
    # Visit the page first before each test
    before {visit root_path}

    # Tests
    it {should     have_selector("h1",     text: 'Sample App')}
    it {should     have_selector("title",  text: full_title(''))}
    it {should_not have_selector("title",  text: "| Home")}
  end


  # ===============================
  # Help page tests
  # ===============================
  describe "Help page" do
    # Visit the page first before each test
    before {visit help_path}

    # Tests
    it {should have_selector("h1",    text:'Help me please')}
    it {should have_selector("title", text:full_title('Help'))}
  end


  # ===============================
  # About page tests
  # ===============================
  describe "About page" do
    # Visit the page first before each test
    before {visit about_path}

    # Tests
    it {should have_selector("h1",      text: "About Us")}
    it {should have_selector("title" ,  text: full_title('About'))}
  end


  # ===============================
  # Contact Page tests
  # ===============================
  describe "Contact page" do
    # Visit the page first before each test
    before {visit contact_path}

    # Tests
    it {should have_selector("h1",    text: "Contact us")}
    it {should have_selector("title", text: full_title('Contact'))}
  end
end