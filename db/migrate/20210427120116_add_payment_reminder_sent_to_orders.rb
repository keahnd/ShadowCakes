class AddPaymentReminderSentToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :payment_reminder, :boolean, default: false

    Order.where(payment_reminder: nil).update_all(payment_reminder: false)
  end
end
