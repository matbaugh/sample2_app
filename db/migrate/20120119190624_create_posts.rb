class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
