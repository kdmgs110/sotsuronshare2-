class AddBioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio, :string, default: "No bio"
  end
end
