require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.new
      @user.name = "Test"
      @user.email = "test@test.com"
      @user.password = "password"
      @user.password_confirmation = "password"
    end

    it 'should create a user' do
      expect(@user.errors.full_messages).to eq([])
    end
    
    it 'should validate password' do
      @user.password = nil
      expect(@user.errors.full_messages).to eq(["Password can't be blank"])
    end

    it 'should validate password confirmation' do
      @user.password_confirmation = nil
      expect(@user.errors.full_messages).to eq(["Password_confirmation can't be blank"])
    end
  end

  describe '.authenticate_with_credentials' do

  end

end
