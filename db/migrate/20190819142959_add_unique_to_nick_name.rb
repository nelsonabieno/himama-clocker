class AddUniqueToNickName < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :user_nick, unique: true
    add_index :users, :email, unique: true
  end
end
