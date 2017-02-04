class AddThesisNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :thesisName, :string
  end
end
