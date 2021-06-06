sclass CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.decimal :rating
      t.text :comment

      t.timestamps
    end
  end
end
