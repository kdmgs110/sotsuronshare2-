class AddThesisNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :thesisName, :string, default: "No thesis name"
  end
end
