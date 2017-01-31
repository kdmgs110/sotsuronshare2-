class AddUseNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, default: "ユーザーネームを編集してください。"
  end
end
