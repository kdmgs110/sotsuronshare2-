class AddMajorToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :major, :string
    add_column :posts, :year, :integer
    add_column :posts, :teacher, :string
  end
end
