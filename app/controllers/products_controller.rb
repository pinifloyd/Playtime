class ProductsController < ApplicationController
  load_and_authorize_resource 
  
  def index
    @search = Product.search(params[:search])
    @products = @search.all
  end
  
  def show
  end
  
  def new
  end
  
  def create
    if @product.save
      flash[:notice] = "Successfully created product."
      comment = Comment.create(:product_id => @product.id, :name => "root", :comment_body => "root")
      redirect_to @product
    else
      render 'products/new'
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    #raise params.to_yaml
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:notice] = "Successfully updated product."
      redirect_to @product
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @product.destroy
    flash[:notice] = "Successfully destroyed product."
    redirect_to products_url
  end
end
