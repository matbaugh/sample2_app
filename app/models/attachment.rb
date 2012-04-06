class Attachment < ActiveRecord::Base
  has_attached_file :data, :styles => {:thumb=> "100x100#", :small=> "150x150>", :large=> "800x800>"}
  
  belongs_to :micropost
  
   before_post_process :image?
   
 
 def image?
   !(data_content_type =~ /^image.*/).nil?
 end 

  
end
