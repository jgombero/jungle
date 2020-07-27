require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    context "Password" do

      it "should not be valid without a password" do
        @user = User.new(first_name: "Josh", last_name: "Gomberoff", email: "joshuagomberoff@gmail.com", password: nil, password_confirmation: "password")

        @user.save
        
        expect(@user).to_not be_valid
      end

      it "should not be valid without a password_confirmation" do
        @user = User.new(first_name: "Josh", last_name: "Gomberoff", email: "joshuagomberoff@gmail.com", password: "password", password_confirmation: "")

        @user.save
        
        expect(@user).to_not be_valid
      end

      it "should be valid when password and password_confirmation match" do
        @user = User.new(first_name: "Josh", last_name: "Gomberoff", email: "joshuagomberoff@gmail.com", password: "password", password_confirmation: "password")

        @user.save
        
        expect(@user).to be_valid
      end

      it "should not be valid when password and password_confirmation do not match" do
        @user = User.new(first_name: "Josh", last_name: "Gomberoff", email: "joshuagomberoff@gmail.com", password: "password", password_confirmation: "llama")

        @user.save
        
        expect(@user).to_not be_valid
      end

      it "should not be valid when password is under minimum length" do
        @user = User.new(first_name: "Josh", last_name: "Gomberoff", email: "joshuagomberoff@gmail.com", password: "pass", password_confirmation: "pass")

        @user.save
        
        expect(@user).to_not be_valid
      end
    end

    context "Emails" do

      it "should not be valid when email already exists" do

      end

      it "should be valid when email is unique" do

      end
    end

    it "should not be valid without an email" do

    end

    it "should not be valid without a first name" do

    end

    it "should not be valid without last name" do

    end
  end
end
