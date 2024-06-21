class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :some_purchase_attribute, presence: true
end
