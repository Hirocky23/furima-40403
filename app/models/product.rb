class Product < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_payer
  belongs_to :shipping_region
  belongs_to :shipping_day

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_payer_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_region_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_day_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end