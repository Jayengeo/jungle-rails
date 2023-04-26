require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
      it "all four fields set will indeed save successfully" do
        @product = Product.new 
        @category = Category.new
        @category.name = 'Grass'
        @product.name = 'Tall Grass'
        @product.price_cents = 321
        @product.quantity = 2
        @product.category = @category
        expect(@product.valid?).to be true
      end
      it "product must have a name" do 
        @product = Product.new 
        @category = Category.new
        @category.name = 'Grass'
        @product.name = nil
        @product.price_cents = 321
        @product.quantity = 2
        @product.category = @category
        @product.valid?
      expect(@product.errors[:name]).to  include("can't be blank")
      end
      it "product must have a price" do 
        @product = Product.new 
        @category = Category.new
        @category.name = 'Grass'
        @product.name = 'Tall Grass'
        @product.price_cents = nil
        @product.quantity = 2
        @product.category = @category
        @product.valid?
      expect(@product.errors[:price_cents]).to  include("is not a number")
      end
      it "product must have a quantity" do 
        @product = Product.new 
        @category = Category.new
        @category.name = 'Grass'
        @product.name = 'Tall Grass'
        @product.price_cents = 321
        @product.quantity = nil
        @product.category = @category
        @product.valid?
      expect(@product.errors[:quantity]).to  include("can't be blank")
      end
      it "product must have a category" do 
        @product = Product.new 
        @category = Category.new
        @category.name = 'Grass'
        @product.name = 'Tall Grass'
        @product.price_cents = 321
        @product.quantity = 2
        @product.category = nil
        @product.valid?
      expect(@product.errors[:category]).to  include("can't be blank")
      end
  end
end 
