require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    context "Password" do

      it "should not be valid without a password" do
        @user = User.new(first_name: "Josh", last_name: "Gomberoff", email: "example@sample.org", password: nil, password_confirmation: "password")

        @user.save
        
        expect(@user).to_not be_valid
      end

      it "should not be valid without a password_confirmation" do
        @user = User.new(first_name: "Josh", last_name: "Gomberoff", email: "example@sample.org", password: "password", password_confirmation: "")

        @user.save
        
        expect(@user).to_not be_valid
      end

      # Have to reset db after each test run
      it "should be valid when password and password_confirmation match" do
        @user = User.new(first_name: "Josh", last_name: "Gomberoff", email: "example@sample.org", password: "password", password_confirmation: "password")

        @user.save
        
        expect(@user).to be_valid
      end

      it "should not be valid when password and password_confirmation do not match" do
        @user = User.new(first_name: "Josh", last_name: "Gomberoff", email: "example@sample.org", password: "password", password_confirmation: "llama")

        @user.save
        
        expect(@user).to_not be_valid
      end

      it "should not be valid when password is under minimum length" do
        @user = User.new(first_name: "Josh", last_name: "Gomberoff", email: "example@sample.org", password: "pass", password_confirmation: "pass")

        @user.save
        
        expect(@user).to_not be_valid
      end
    end

    context "Emails" do

      it "should not be valid when email already exists" do
        @user = User.new(first_name: "Josh", last_name: "Gomberoff", email: "example@sample.org", password: "password", password_confirmation: "password")

        @user.save

        @user2 = User.new(first_name: "Bat", last_name: "Man", email: "EXAMPLE@SAMPLE.ORG", password: "password", password_confirmation: "password")

        @user2.save
        
        expect(@user2).to_not be_valid
      end

      it "should be valid when email is unique" do
        @user = User.new(first_name: "Josh", last_name: "Gomberoff", email: "example@sample.org", password: "password", password_confirmation: "password")

        @user.save

        @user2 = User.new(first_name: "Bat", last_name: "Man", email: "batman@wayneenterprises.com", password: "password", password_confirmation: "password")

        @user2.save
        
        expect(@user2).to be_valid
      end
    end

    it "should not be valid without an email" do
      @user = User.new(first_name: "Josh", last_name: "Gomberoff", email: nil, password: "password", password_confirmation: "password")

      @user.save
      
      expect(@user).to_not be_valid
    end

    it "should not be valid without a first name" do
      @user = User.new(first_name: nil, last_name: "Gomberoff", email: "example@sample.org", password: "password", password_confirmation: "password")

        @user.save
        
        expect(@user).to_not be_valid
    end

    it "should not be valid without last name" do
      @user = User.new(first_name: "Josh", last_name: nil, email: "example@sample.org", password: "password", password_confirmation: "password")

      @user.save
      
      expect(@user).to_not be_valid
    end
  end


  describe '.authenticate_with_credentials' do

    before(:all) do
      @user = User.create(first_name: "Josh", last_name: "Gomberoff", email: "example@sample.org", password: "password", password_confirmation: "password")

      @user.save
    end

    it "should return instance of the user if user credentials are correct" do

      user = User.authenticate_with_credentials("example@sample.org", "password")

      expect(user).to_not be_nil
    end

    it "should return nil if user paswword is correct but email is incorrect" do

      user = User.authenticate_with_credentials("eggsample@sample.org", "password")

      expect(user).to be_nil
    end

    it "should return nil if user email is correct but password is incorrect" do

      user = User.authenticate_with_credentials("example@sample.org", "passwor")
      
      expect(user).to be_nil
    end

    it "should be valid when email is correct but with added spaces before and/or after" do

      user = User.authenticate_with_credentials("  example@sample.org ", "password")

      expect(user).to_not be_nil
    end

    it "should be valid when email is correct, but casing is incorrect" do

      user = User.authenticate_with_credentials("EXAMPLE@SAMPLE.ORG", "password")

      expect(user).to_not be_nil
    end
  end
end
