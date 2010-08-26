class CommentsController < ApplicationController
  load_and_authorize_resource :product
  load_and_authorize_resource :comment, :through => :product
  
  def index
    @comments = Comment.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end
  
  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @product = Product.find(params[:product_id])
    respond_to do |format|
      format.html
      format.js { render :partial => '/comments/new' }
    end
  end

  def edit
  end

  def create
    @product = Product.find(params[:product_id])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(product_path(@comment.product), :notice => 'Comment was successfully created.')}
        format.js
      else
        format.html { render :action => "new" }
        format.js {render :partial => 'create_failed', :locals => {:comment => @comment}}
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end
