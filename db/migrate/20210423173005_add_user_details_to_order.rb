class AddUserDetailsToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :email, :text
    add_column :orders, :client_id, :integer
  end
end
