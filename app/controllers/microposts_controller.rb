class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
  
  def create
    @micropost = current_user.microposts.build(params[:micropost])
    @micropost.group_id = params[:micropost][:group_id]
    if @micropost.save
      if params[:attachment]
	  attrs = params[:attachment][:data]
	  attrs.each do |attr|
	      @attachment = Attachment.new(:data => attr)
	      @attachment.micropost_id = @micropost.id
      	      @attachment.save
      	  end
      	end
      
      
      flash[:success] = "Micropost create!"
      redirect_to @micropost.group
    else
      #@feed_items = []
      redirect_to @micropost.group
    end
  end 
  
  def destroy
    @micropost.destroy
    redirect_to :back
    #redirect_back_or root_path
  end
  
  private
  
  def authorized_user
    @micropost = current_user.microposts.find_by_id(params[:id])
    redirect_to root_path if @micropost.nil?
  end
end 