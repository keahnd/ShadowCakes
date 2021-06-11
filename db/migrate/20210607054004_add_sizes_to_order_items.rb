class AddSizesToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :diffSize, :text, default: ""
    add_column :order_items, :priceDiff, :decimal, default: 0.0
  end
end
