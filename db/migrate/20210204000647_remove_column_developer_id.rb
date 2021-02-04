class RemoveColumnDeveloperId < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :developer_id, :integer
  end
end
