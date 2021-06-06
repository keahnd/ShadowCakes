class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name,               default: ''
      t.text :description,          default: ''
      t.decimal :price,             default: 0.0
      t.boolean :gluten_free,       default: false
      t.boolean :dairy_free,        default: false
      t.boolean :contains_peanuts,  default: false
      t.boolean :featured,          default: false

      t.timestamps
    end
  end
end
