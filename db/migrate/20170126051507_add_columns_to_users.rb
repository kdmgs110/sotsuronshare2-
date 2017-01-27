class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :abstract, :text, default: "No bio"
  end
end
