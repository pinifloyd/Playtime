class CategoriesController < ApplicationController
  
  def index
    @categories = Category.ascend_by_category_name
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Successfully created category."
      redirect_to root_url
    else
      render :action => "new"
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "Successfully updated category."
      redirect_to root_url
    else
      render :action => "edit"
    end
  end
end
