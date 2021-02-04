class AddDeveloperRequestToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :developer_request, :boolean
  end
end
