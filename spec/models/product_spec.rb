require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new
      @product = Product.new
      @product.category = @category
      @product.name = "hello"
      @product.price = 3
      @product.quantity = 5
    end

    # validation tests/examples here
    it 'should create a product' do
      expect(@product.errors.full_messages).to eq([])
    end

    it 'should validate name' do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    end

    it 'should validate price' do
      @product.price = nil
      @product.save
      expect(@product.errors.full_messages).to eq(["Price can't be blank"])
    end

    it 'should validate quantity' do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to eq(["Quantity can't be blank"])
    end
    
    it 'should validate category' do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages).to eq(["Category can't be blank"])
    end
  end
end
