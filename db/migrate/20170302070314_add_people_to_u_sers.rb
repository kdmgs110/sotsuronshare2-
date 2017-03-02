class AddPeopleToUSers < ActiveRecord::Migration
  def change
  add_column :users, :people, :text
  end
end
