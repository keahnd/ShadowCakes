class AddDetailsToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :status, :text, default: 'cart'
    add_column :orders, :first_name, :text
    add_column :orders, :last_name, :text

    Order.where(status: nil).update_all(status: 'cart')
  end
end
