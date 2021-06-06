class AddOrderDeleteReminderToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :order_delete_reminder, :boolean, default: false

     Order.where(order_delete_reminder: nil).update_all(order_delete_reminder: false)
  end
end
