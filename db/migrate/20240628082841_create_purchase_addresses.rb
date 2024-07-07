class CreatePurchaseAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_addresses do |t|
      t.string :postal_code, null: false
      t.integer :shipping_region_id, null: false
      t.string :city, null: false
      t.string :address_line, null: false
      t.string :building_name
      t.string :phone_number, null: false
      t.references :purchase, null: false, foreign_key: true

      t.timestamps
    end
    add_check_constraint :purchase_addresses, "postal_code ~ '^\d{3}-\d{4}$'", name: 'postal_code_format'
    add_check_constraint :purchase_addresses, "phone_number ~ '^\d{10,11}$'", name: 'phone_number_format'
  end
end
