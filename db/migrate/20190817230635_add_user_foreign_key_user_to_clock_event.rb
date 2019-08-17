class AddUserForeignKeyUserToClockEvent < ActiveRecord::Migration[5.2]
  def change
    add_reference :clock_events, :user, foreign_key: true
  end
end
