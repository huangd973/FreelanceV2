class AddColumnsToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :client_id, :integer
    add_column :rooms, :dev_id, :integer
  end
end
