class CommentsController < ApplicationController
  before_filter :get_parent
  

  def create
    @comment = @parent.comments.build(params[:comment])
    saved = @comment.save
    while @parent.is_a?(Comment)
      @parent = @parent.commentable
    end
    redirect_to group_path(@parent.group), :notice => saved ? 'Thanks for posting a comment!' : 'No comment added'
  end
  
  protected
  
  def get_parent
    @parent = Micropost.find_by_id(params[:micropost_id]) if params[:micropost_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    
    redirect_to root_path unless defined?(@parent)
  end
  
  
  
end
