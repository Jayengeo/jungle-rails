class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Product.new
  end

  def create
    @category = Category.new(category_params)
  end
end
