class AddPickUpDateAndTimeToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :pick_up_date, :date
    add_column :orders, :pick_up_time, :time
  end
end
