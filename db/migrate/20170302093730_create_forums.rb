class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.string   "major"
    t.string   "keyword"
    t.timestamps null: false
    end
  end
end
