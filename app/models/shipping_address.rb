class ShippingAddress < ApplicationRecord
belongs_to :purchase

validates :postal_code, presence: true
validates :shipping_region_id, presence: true
validates :city, presence: true
validates :address_line, presence: true
validates :phone_number, presence: true
validates :purchase_id, presence: true
end