class UsersController < ApplicationController  
  def index
    @users = User.find(:all, :order => :name)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User #{@user.name} was successfully created."
      redirect_to root_url
    else
      render :action => "new" 
    end      
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "User #{@user.name} was successfully updated."
      redirect_to root_url
    else
      render :action => "edit"
    end    
  end

  def destroy
    @user = User.find(params[:id])
    begin
      flash[:notice] = "User #{@user.name} deleted"
      @user.destroy
    rescue Exception => e
      flash[:notice] = e.message
    end
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
