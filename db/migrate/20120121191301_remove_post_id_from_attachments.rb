class RemovePostIdFromAttachments < ActiveRecord::Migration
  def self.up
    remove_column :attachments, :post_id
  end

  def self.down
    add_column :attachments, :post_id, :integer
  end
end
