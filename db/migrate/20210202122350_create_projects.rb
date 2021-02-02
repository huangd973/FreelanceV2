class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :budget
      t.boolean :statut
      t.string :description
      t.boolean :payed

      t.timestamps
    end
  end
end
