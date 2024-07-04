class ShippingAddress < ApplicationRecord
  belongs_to :purchase

  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :shipping_region_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :city, :address_line, :phone_number, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid" }
end
