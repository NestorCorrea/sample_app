require 'spec_helper'

describe "Static pages" do
  # Set the main subject for all the tests
  subject {page}


  # ===============================
  # Shared Examples
  # ===============================
  shared_examples_for "all static pages" do
    it {should have_selector("h1",    text: heading)}
    it {should have_selector("title", text: full_title(page_title))}
  end


  # ===============================
  # Home page tests
  # ===============================
  describe "Home page" do
    # Visit the page first before each test
    before {visit root_path}

    # Set variables
    let(:heading)     {'Sample App'}
    let(:page_title)  {''}

    # Run test shared tests
    it_should_behave_like "all static pages"

    # Tests
    it {should_not have_selector("title",  text: "| Home")}
  end


  # ===============================
  # Help page tests
  # ===============================
  describe "Help page" do
    # Visit the page first before each test
    before {visit help_path}

    # Set variables
    let(:heading)     {'Help me please'}
    let(:page_title)  {'Help'}

    # Run test shared tests
    it_should_behave_like "all static pages"
  end


  # ===============================
  # About page tests
  # ===============================
  describe "About page" do
    # Visit the page first before each test
    before {visit about_path}

    # Set variables
    let(:heading)     {'About Us'}
    let(:page_title)  {'About'}

    # Run test shared tests
    it_should_behave_like "all static pages"
  end


  # ===============================
  # Contact Page tests
  # ===============================
  describe "Contact page" do
    # Visit the page first before each test
    before {visit contact_path}

    # Set variables
    let(:heading)     {'Contact us'}
    let(:page_title)  {'Contact'}

    # Run test shared tests
    it_should_behave_like "all static pages"
  end
end