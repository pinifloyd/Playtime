class CategoriesController < ApplicationController
  
  def json_data    
    json_object = [Category.root.to_jstree_json]
    logger.debug json_object.to_yaml
    respond_to do |format|
      format.json { render :json => json_object }
    end
  end
  
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
