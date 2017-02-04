class RemoveDefaultToUsers < ActiveRecord::Migration
  def change
    change_column_default(:users, :username, nil)
    change_column_default(:users, :bio, nil)
    change_column_default(:users, :thesisName, nil)
    change_column_default(:users, :abstract, nil)
  end
end
