require 'spec_helper'

describe "User pages" do

  # Set the main subject for all the tests
  subject {page}


  # ===============================
  # User Page Examples
  # ===============================
  describe "Sign up pages" do
    before {visit signup_path}

    it {should have_selector('h1',    text: 'Sign up')}
    it {should have_selector('title', text: full_title('Sign up'))}
  end

  describe 'profile page' do
    let(:user){FactoryGirl.create(:user)}
    before{visit user_path(user)}

    it {should have_selector('h1',    text: user.name)}
    it {should have_selector('title', text: user.name)}
  end


  # ===============================
  # Signup Examples
  # ===============================
  describe 'sign up' do
    # Visit the signup path for each
    before {visit signup_path}

    # Set the submit button value to be used in the tests
    let(:submit) {"Create my account"}

    # Test an invalid submission first the page is blank at this point
    describe "invalid submission" do
      it 'should not create a user' do
        expect{click_button submit}.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      # fill in the form
      before do
        fill_in "Name",         with:"Nestor Correa"
        fill_in "Email",        with:"nestor@email.com"
        fill_in "Password",     with:"asdasd"
        fill_in "Confirmation", with:"asdasd"
      end

      it "should create a user" do
        expect { click_button submit  }.to change(User, :count).by(1)
      end
    end
  end
end