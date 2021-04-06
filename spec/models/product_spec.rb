require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    # validation tests/examples here
    it 'should create a valid product' do
      @category = Category.new(name: "world")
      @product = Product.new(name:"hello", price:3, category:@category, quantity: 5)
      expect(@product).to be_valid
      @product.errors.full_messages
    end

    it 'should create a product' do
      @category = Category.new(name: "world")
      @product = Product.new(name: "hello", price: 3, category: @category, quantity: 5)
      expect(@product.errors.full_messages).to eq([])
    end

    it 'should validate name' do
      @category = Category.new(name: "world")
      @product = Product.new(name: nil, price: 3, category: @category, quantity: 5)
      @product.save
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    end

    it 'should validate price' do
      @category = Category.new(name: "world")
      @product = Product.new(name: "hello", price: nil, category: @category, quantity: 5)
      @product.save
      expect(@product.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end

    it 'should validate quantity' do
      @category = Category.new(name: "world")
      @product = Product.new(name: "hello", price: 3, category: @category, quantity: nil)
      @product.save
      expect(@product.errors.full_messages).to eq(["Quantity can't be blank"])
    end
    
    it 'should validate category' do
      @category = Category.new(name: "world")
      @product = Product.new(name: "hello", price: 3, category: nil, quantity: 5)
      @product.save
      expect(@product.errors.full_messages).to eq(["Category can't be blank"])
    end
  end
end
