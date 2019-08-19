class AddLoginStatusToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :login_status, :boolean
  end
end
