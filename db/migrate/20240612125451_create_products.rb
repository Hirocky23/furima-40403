class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_payer_id, null: false
      t.integer :shipping_region_id, null: false
      t.integer :shipping_day_id, null: false
      t.integer :price, null: false

      t.timestamps
    end
    add_check_constraint :items, 'price >= 300 AND price <= 9999999', name: 'price_range'
  end
end