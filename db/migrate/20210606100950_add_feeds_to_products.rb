class AddFeedsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :feeds, :text, default: ""

    Product.where(feeds: nil).update_all(feeds: "6 in feeds 5 people.
8 in feeds 10 people."
)
  end
end
