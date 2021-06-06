class AddDetailsToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :status, :string, default: 'cart'
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string

    Order.where(status: nil).update_all(status: 'cart')
  end
end
