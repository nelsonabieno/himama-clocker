class AddUserNickToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_nick, :string
  end
end
