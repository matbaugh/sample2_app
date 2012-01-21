class AddGroupIdToMicroposts < ActiveRecord::Migration
  def self.up
    add_column :microposts, :group_id, :integer
  end

  def self.down
    remove_column :microposts, :group_id
  end
end
