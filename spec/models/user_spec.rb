require 'rails_helper'
require 'user'

RSpec.describe User, type: :model do
  describe 'Validations' do

    context "All fields filled out correctly" do
      it "Creates user successfully" do
        @user = User.new
        @user.name = "Omar"
        @user.email = "jeremiah_smalls@hotmail.com"
        @user.password = "omaristhebest"
        @user.password_confirmation = "omaristhebest"
        @user.save
        expect(@user.errors.full_messages).to match_array([])
      end
    end

    context "Password and confirmation do not match" do
      it "throws error" do
        @user = User.new
        @user.name = "Omar"
        @user.email = "jeremiah_smalls@hotmail.com"
        @user.password = "omaristhebest"
        @user.password_confirmation = "omaristheworst"
        @user.save
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context "No password or confirmation" do
      it "throws error" do
        @user = User.new
        @user.name = "Omar"
        @user.email = "jeremiah_smalls@hotmail.com"
        @user.password = nil
        @user.password_confirmation = nil
        @user.save
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
    end

    context "Email is duplicated" do
      it "throws error" do
        @user1 = User.new
        @user1.name = "Omar"
        @user1.email = "jeremiah_smalls@hotmail.com"
        @user1.password = "omaristhebest"
        @user1.password_confirmation = "omaristhebest"
        @user1.save

        @user2 = User.new
        @user2.name = "James"
        @user2.email = "jeremiah_smalls@hotmail.com"
        @user2.password = "jimmy"
        @user2.password_confirmation = "jimmy"
        @user2.save
        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end
    end

    context "No name" do
      it "throws error" do
        @user = User.new
        @user.name = nil
        @user.email = "jeremiah_smalls@hotmail.com"
        @user.password = "cheese"
        @user.password_confirmation = "cheese"
        @user.save
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
    end

    context "No email" do
      it "throws error" do
        @user = User.new
        @user.name = "Timmy"
        @user.email = nil
        @user.password = "cheese"
        @user.password_confirmation = "cheese"
        @user.save
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    end

    context "Password less than 3 characters" do
      it "throws error" do
        @user = User.new
        @user.name = "Timmy"
        @user.email = "je@smaills.com"
        @user.password = "ch"
        @user.password_confirmation = "ch"
        @user.save
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
      end
    end

    
  end

  describe '.authenticate_with_credentials' do
    context "Given correct email and password" do
      it "successfully authenticates" do
        @user = User.new
        @user.name = "Omar"
        @user.email = "jeremiah_smalls@hotmail.com"
        @user.password = "omaristhebest"
        @user.password_confirmation = "omaristhebest"
        @user.save
        expect(@user.authenticate_with_credentials(@user.email, @user.password)).to match(@user)
      end
    end

    context "Given correct email and incorrect password" do
      it "returns nil" do
        @user = User.new
        @user.name = "Omar"
        @user.email = "jeremiah_smalls@hotmail.com"
        @user.password = "omaristhebest"
        @user.password_confirmation = "omaristhebest"
        @user.save
        expect(@user.authenticate_with_credentials(@user.email, "oshfihf")).to be_nil
      end
    end

    context "Given incorrect email" do
      it "returns nil" do
        @user = User.new
        @user.name = "Omar"
        @user.email = "jeremiah_smalls@hotmail.com"
        @user.password = "omaristhebest"
        @user.password_confirmation = "omaristhebest"
        @user.save
        expect(@user.authenticate_with_credentials("jeremiah.biggs@gmail.com", @user.password)).to be_nil
      end
    end

    context "Given correct email (with spaces) and password" do
      it "successfully authenticates" do
        @user = User.new
        @user.name = "Omar"
        @user.email = "jeremiah_smalls@hotmail.com"
        @user.password = "omaristhebest"
        @user.password_confirmation = "omaristhebest"
        @user.save
        expect(@user.authenticate_with_credentials(" jeremiah_smalls@hotmail.com ", @user.password)).to match(@user)
      end
    end

    context "Given correct email (with incorrect casing) and password" do
      it "successfully authenticates" do
        @user = User.new
        @user.name = "Omar"
        @user.email = "jeremiah_smalls@hotmail.com"
        @user.password = "omaristhebest"
        @user.password_confirmation = "omaristhebest"
        @user.save
        expect(@user.authenticate_with_credentials("jerEmiah_smAlls@hOtmail.com", @user.password)).to match(@user)
      end
    end
  end

end
