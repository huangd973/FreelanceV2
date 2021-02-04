class AddPhoneToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :phone, :string
  end
end
