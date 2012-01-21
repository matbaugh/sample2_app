class Attachment < ActiveRecord::Base
  
  #add paperclip shit
  belongs_to :micropost
  
end
