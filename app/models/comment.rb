class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable 
  validates_presence_of :body, :commentable_id, :commentable_type

def micropost
  return @micropost if defined?(@micropost)
  @micropost = commentable.is_a?(Micropost) ? commentable : commentable.micropost
end

end