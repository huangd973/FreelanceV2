class AddCategoriesToProjects < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :categorie, foreign_key: true
  end
end
