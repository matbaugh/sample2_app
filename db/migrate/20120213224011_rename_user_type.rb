class RenameUserType < ActiveRecord::Migration
  def self.up
    rename_column :users, :user_type, :type
  end

  def self.down
  end
end
