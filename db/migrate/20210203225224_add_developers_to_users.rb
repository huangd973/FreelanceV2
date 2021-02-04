class AddDevelopersToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :developer, foreign_key: true
  end
end
