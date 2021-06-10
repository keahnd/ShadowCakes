class AddSizesToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :diffSize, :text
    add_column :order_items, :priceDiff, :decimal
  end
end
