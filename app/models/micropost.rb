class Micropost < ActiveRecord::Base
  attr_accessible :content
  
  
  has_many :attachments
  has_many :comments, :as => :commentable 
  
  belongs_to :user 
  belongs_to :group
  
  validates :content, :presence => true, :length => { :maximum => 1000 }
  validates :user_id, :presence => true
  
  default_scope :order => 'created_at DESC'
  
end
