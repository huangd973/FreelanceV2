class ChangeImageToBeStringInCategories < ActiveRecord::Migration[6.1]
  def change
    change_column :categories, :image, :string
  end
end
