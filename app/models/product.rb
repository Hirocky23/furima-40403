class Product < ApplicationRecord
  belongs_to :user
  has_one :purchase

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_payer_id, presence: true
  validates :shipping_region_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
