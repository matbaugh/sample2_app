class Group < ActiveRecord::Base
  
  has_and_belongs_to_many :users
  belongs_to :owner, :class_name => 'Teacher'
  has_many :microposts
  
  after_create :add_owner_to_users
  
  validates :owner, :presence => true
  validates :name, :presence => true
  
  private
  
  def add_owner_to_users
      self.users << self.owner 
  end

end
