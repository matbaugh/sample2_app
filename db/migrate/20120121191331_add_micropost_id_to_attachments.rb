class AddMicropostIdToAttachments < ActiveRecord::Migration
  def self.up
    add_column :attachments, :micropost_id, :integer
  end

  def self.down
    remove_column :attachments, :micropost_id
  end
end
