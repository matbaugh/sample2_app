class GroupsController < ApplicationController


   
  def index
    @title = "All Classes"
    @groups = Group.paginate(:page => params[:page])
  end 
  
  def show
    @group = Group.find(params[:id])
    @microposts = @group.microposts.paginate(:page => params[:page])
    @micropost = Micropost.new
    @title = @group.name
  end

  def new
    @group = Group.new
    @title = "New Class"
  end
  
  def create
    @group = Group.new(params[:group])
    @group.owner = current_user
    if @group.save
      flash[:success] = "Class created."
      redirect_to @group
    else
      @title = "New Class"
      render 'new'
    end
  end
  
  def edit
    @group = Group.find(params[:id])
    @title = "Edit Group"
  end 
  
  def update 
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      flash[:success] = "Class updated"
      redirect_to @group
    else
      @title = "Edit Group"
      render 'edit'
    end
  end
  
  def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "Group destroyed."
    redirect_to Groups_path
  end
  
  def membership
    @group = Group.find(params[:id])    
  end
  
  def add_member
    @group = Group.find(params[:group_id])    
    @user = User.find(params[:id])
    @group.users << @user
    redirect_to :action=>:membership, :id=>@group.id
  end
end
