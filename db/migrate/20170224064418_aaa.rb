class Aaa < ActiveRecord::Migration
  def change
    change_column(:users, :years, :string)
  end
end
