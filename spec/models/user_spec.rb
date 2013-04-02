# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  # ===============================
  # Setup
  # ===============================
  # Declair a user object to be used in the tests
  before do
    @user = User.new(name: "nestor", email: "nestor@gelaskins.com", password: "foobar", password_confirmation:"foobar")

  end

  # Set the subect for the test to be used as a reference
  subject { @user }


  # ===============================
  # Checks
  # ===============================
  it{ should respond_to(:email) }
  it{ should respond_to(:name) }
  it{ should respond_to(:password_digest) }
  it{ should respond_to(:password) }
  it{ should respond_to(:password_confirmation) }
  it{ should respond_to(:authenticate)}

  it{ should be_valid }



  # ===============================
  # Name and email
  # ===============================
  # Make sure the user name is valid
  describe 'when the name is not present' do
    before{ @user.name = "" }
    it{ should_not be_valid }
  end

  # Make sure the email is valid
  describe 'when the email is not present' do
    before{ @user.email = ""}
    it { should_not be_valid }
  end

  describe 'when a user name is too long' do
    before{ @user.name = "a" * 100}
    it{ should_not be_valid }
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe 'when the email address is already taken' do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.downcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end


  # ===============================
  # Password
  # ===============================
  describe 'when a password is not present' do
    before { @user.password = @user.password_confirmation = " "}
    it{should_not be_valid}
  end

  describe 'when the confirmation does not match' do
    before{@user.password_confirmation = "mispatch"}

    it{should_not be_valid}
  end

  describe 'when the confirmation is nil' do
    before { @user.password_confirmation = nil}

    it{should_not be_valid}
  end

  describe 'password is too short' do
    before { @user.password = @user.password_confirmation =  "123"}
    it {should_not be_valid}
  end



  # ===============================
  # Authenticate
  # ===============================
  describe 'return value of authenticate method' do
    before { @user.save }
    let (:found_user){User.find_by_email(@user.email)}

    describe 'with valid password' do
      it{should == found_user.authenticate(@user.password) }
    end

    describe 'with invalid password' do
      let(:user_for_invalid_password){
        found_user.authenticate("invalid")
      }

      it {should_not == user_for_invalid_password}
      specify {user_for_invalid_password.should be_false}

    end
  end
end