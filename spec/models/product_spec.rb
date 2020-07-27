require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "will save succesfully when all four fields are set" do
      @category = Category.new
      @product = Product.new(category: @category, name: "product", price: 100, quantity: 10)

      @product.save
      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @category = Category.new
      @product = Product.new(category: @category, name: nil, price: 100, quantity: 10)

      @product.save
      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @category = Category.new
      @product = Product.new(category: @category, name: "product", price: nil, quantity: 10)

      @product.save
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @category = Category.new
      @product = Product.new(category: @category, name: "product", price: 100, quantity: nil)

      @product.save
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      @category = Category.new
      @product = Product.new(category: nil, name: "product", price: 100, quantity: 10)

      @product.save
      expect(@product).to_not be_valid
    end
  end
end
