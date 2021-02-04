class AddDevelopersToProjects < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :developer, foreign_key: true
  end
end
