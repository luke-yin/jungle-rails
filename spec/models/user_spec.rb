require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should create a user' do
      @user = User.create(first_name: "Test", last_name: "Tester", email: "test@test.com", password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to eq([])
    end

    it 'should validate first name' do
      @user = User.create(first_name: nil, last_name: "Tester", email: "test@test.com", password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to eq(["First name can't be blank"])
    end

    it 'should validate last name' do
      @user = User.create(first_name: "Test", last_name: nil, email: "test@test.com", password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to eq(["Last name can't be blank"])
    end
    
    it 'should validate password' do
      @user = User.create(first_name: "Test", last_name: "Tester", email: "test@test.com", password: nil, password_confirmation: "password")
      expect(@user.errors.full_messages).to eq(["Password can't be blank", "Password is too short (minimum is 6 characters)"])
    end

    it 'should validate password confirmation' do
      @user = User.create(first_name: "Test", last_name: "Tester", email: "test@test.com", password: "password", password_confirmation: "")
      expect(@user.errors.full_messages).to eq(["Password confirmation doesn't match Password"])
    end

    it 'should make sure that password and password_confirmation are the same' do
      @user = User.create(first_name: "Test", last_name: "Tester", email: "test@test.com", password: "password", password_confirmation: "1234")
      expect(@user.errors.full_messages).to eq(["Password confirmation doesn't match Password"])
    end

    it 'should make sure that the email is unique but not case-sensitive' do
      @user = User.create(first_name: "Test", last_name: "Tester", email: "test@test.COM", password: "password", password_confirmation: "password")
      @user1 = User.create(first_name: "Test", last_name: "Tester", email: "TEST@TEST.com", password: "password", password_confirmation: "password")
      expect(@user1.errors.full_messages).to eq(["Email has already been taken"])
    end

    it 'should make sure that the password is at least 6 characters long' do
      @user = User.create(first_name: "Test", last_name: "Tester", email: "test@test.com", password: "1234", password_confirmation: "1234")
      expect(@user.errors.full_messages).to eq(["Password is too short (minimum is 6 characters)"])
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return a valid user' do
      @user = User.create(first_name: "Test", last_name: "Tester", email: "test@test.com", password: "password", password_confirmation: "password")
      @user1 = User.authenticate_with_credentials("  test@test.com  ", "password")
      expect(@user1.email).to eq("test@test.com")
    end

    it 'should return nil' do
      @user = User.create(first_name: "Test", last_name: "Tester", email: "test@test.com", password: "password", password_confirmation: "password")
      @user1 = User.authenticate_with_credentials("test@test.com", "123")
      expect(@user1).to be_nil
    end

    it 'should return a valid user when email has spaces in front or after' do
      @user = User.create(first_name: "Test", last_name: "Tester", email: "test@test.com", password: "password", password_confirmation: "password")
      @user1 = User.authenticate_with_credentials("  test@test.com  ", "password")
      expect(@user1).to_not be_nil
    end

    it 'should return a valid user when email is a different case' do
      @user = User.create(first_name: "Test", last_name: "Tester", email: "test@test.com", password: "password", password_confirmation: "password")
      @user1 = User.authenticate_with_credentials("TeST@TEST.CoM", "password")
      expect(@user1).to_not be_nil
    end
  end

end
