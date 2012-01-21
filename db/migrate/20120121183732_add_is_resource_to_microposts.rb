class AddIsResourceToMicroposts < ActiveRecord::Migration
  def self.up
    add_column :microposts, :is_resource, :boolean
  end

  def self.down
    remove_column :microposts, :is_resource
  end
end
