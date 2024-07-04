class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|
      t.references :purchase, null: false, foreign_key: true
      t.string :postal_code
      t.integer :shipping_region_id
      t.string :city
      t.string :address_line
      t.string :building_name
      t.string :phone_number

      t.timestamps
    end
  end
end
