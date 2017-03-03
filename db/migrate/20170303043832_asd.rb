class Asd < ActiveRecord::Migration
  def change
  end
  add_index :comments, [:user_id, :forum_id]
  add_index :comments, :forum_id
end
