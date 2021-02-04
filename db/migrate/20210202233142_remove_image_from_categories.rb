class RemoveImageFromCategories < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :image, :string
  end
end
