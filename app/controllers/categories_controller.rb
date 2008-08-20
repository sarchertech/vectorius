class CategoriesController < ApplicationController
  
  # GET /categories
  def index
    @categories = Category.find(:all)
  end
  
  # GET /categories/new
  def new
    @category = Category.new
  end
  
  # POST /categories
  def create
    @category = Category.new(params[:category])
  end
  
end
