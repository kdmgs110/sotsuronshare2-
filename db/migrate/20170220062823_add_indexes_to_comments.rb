class AddIndexesToComments < ActiveRecord::Migration
  def change
  end
  
  add_index :comments, [:user_id, :post_id]
  add_index :comments, :post_id
end
