class AddEventNameToClockEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :clock_events, :name, :string
  end
end
