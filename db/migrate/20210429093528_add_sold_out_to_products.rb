class AddSoldOutToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :sold_out, :boolean, default: false

    Product.where(sold_out: nil).update_all(sold_out: false)
  end
end
