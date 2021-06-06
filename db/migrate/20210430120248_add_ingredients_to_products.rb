class AddIngredientsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :ingredients, :text, default: ""

    Product.where(ingredients: nil).update_all(ingredients: "")
  end
end
