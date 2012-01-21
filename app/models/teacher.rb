class Teacher < User
  
  has_many :owned_groups, :class_name => 'Group'
  
end
