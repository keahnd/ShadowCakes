class AddPaymentCompletedToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :payment_completed, :boolean, default: false

    Order.where(payment_completed: nil).update_all(payment_completed: false)
  end
end
