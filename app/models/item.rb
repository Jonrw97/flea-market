class Item < ApplicationRecord
  belongs_to :user
  has_one :receipt
  validates :item_name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true
  has_one_attached :photo
  validates :photo, presence: true
end
