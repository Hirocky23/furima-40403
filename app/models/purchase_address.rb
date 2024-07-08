class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_region_id, :city, :address_line, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "ハイフン（-）がありません" }
    validates :city
    validates :address_line
    validates :phone_number,format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁の数字で入力してください" }
    validates :token
    validates :user_id
    validates :item_id
  end

  validates :shipping_region_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(
      postal_code: postal_code,
      shipping_region_id: shipping_region_id,
      city: city,
      address_line: address_line,
      building_name: building_name,
      phone_number: phone_number,
      purchase_id: purchase.id
    )
  end
end
