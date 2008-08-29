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
    
    if @category.save
      flash[:notice] = "Your new category was successfully created."
      redirect_to(categories_path)
    else
      flash.now[:error] == "Your new category was not created. Please try again."
      render :action => 'new'
    end
  end
  
end
