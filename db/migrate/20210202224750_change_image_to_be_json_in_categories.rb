class ChangeImageToBeJsonInCategories < ActiveRecord::Migration[6.1]
  def change
    change_column :categories, :image, :json
  end
end
