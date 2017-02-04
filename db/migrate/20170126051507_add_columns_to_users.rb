class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :abstract, :text
  end
end
