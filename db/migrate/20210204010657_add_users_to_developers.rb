class AddUsersToDevelopers < ActiveRecord::Migration[6.1]
  def change
    add_reference :developers, :user, foreign_key: true
  end
end
