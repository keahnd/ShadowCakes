class AddSizesToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :mult_size, :boolean, default: false
    add_column :products, :sizes, :text, array: true, default: []
    add_column :products, :priceDiff, :decimal, array: true, default: []

    Product.where(mult_size: nil).update_all(mult_size: false)
    Product.where(sizes: nil).update_all(sizes: [])
    Product.where(priceDiff: nil).update_all(priceDiff: [])
  end
end
