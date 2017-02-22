class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :file
      t.string :title
      t.text :summary
      t.integer :user_id

      t.timestamps null: false
    end
     add_index :posts, :user_id
  end
end
