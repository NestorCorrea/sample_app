require 'spec_helper'

describe "User pages" do
  # Set the main subject for all the tests
  subject {page}

  describe "Sign up pages" do
    before {visit signup_path}

    it {should have_selector('h1',    text: 'Sign Up')}
    it {should have_selector('title', text: full_title('Sign up'))}
  end
end