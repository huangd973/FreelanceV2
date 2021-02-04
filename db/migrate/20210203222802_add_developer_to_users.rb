class AddDeveloperToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :developer, :boolean
  end
end
