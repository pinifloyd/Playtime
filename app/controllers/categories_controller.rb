class CategoriesController < ApplicationController
  
  def json_data    
    category = Category.find_by_id(params[:id])
    if category
      # child
      json_object = category.children.all.collect(&:to_jstree_json)
    else
      # root
      json_object = Category.root.to_jstree_json(true)
    end
    category ||= Category.root
    #logger.debug json_object.to_yaml
    respond_to do |format|
      format.json { render :json => json_object }
    end
  end
  
  def move_tree_node
    category = Category.find(params[:id])
    if category
      parent = Category.find(params[:ref])
      if parent.leaf?
        category.parent_id = params[:ref]
        category.save
      else
        category.move_to_left_of(parent.children[params[:position].to_i])
      end      
      json_object = category.children.all.collect(&:to_jstree_json)
    else
      json_object = Category.root.to_jstree_json(true)
    end
    category ||= Category.root
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
