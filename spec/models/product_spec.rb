require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "all 4 fields are saved" do
      @category = Category.create(name: "Furniture")
      @product = Product.new(name: "Chair", price: 20, quantity: 2, category: @category)
      expect(@product.save).to be(true), @product.errors.full_messages
    end
    it "name is present" do
      @category = Category.create(name: "Furniture")
      @product = Product.new(name: "Chair", price: 20, quantity: 2, category: @category)
      expect(@product.name).should_not be_nil, @product.errors.full_messages
    end
    it "price is present" do
      @category = Category.create(name: "Furniture")
      @product = Product.new(name: "Chair", price: 20, quantity: 2, category: @category)
      expect(@product.price).should_not be_nil, @product.errors.full_messages
    end
    it "quantity is present" do
      @category = Category.create(name: "Furniture")
      @product = Product.new(name: "Chair", price: 20, quantity: 2, category: @category)
      expect(@product.quantity).should_not be_nil, @product.errors.full_messages
    end
    it "category is present" do
      @category = Category.create(name: "Furniture")
      @product = Product.new(name: "Chair", price: 20, quantity: 2, category: @category)
      expect(@product.category).should_not be_nil, @product.errors.full_messages
    end
  end
end