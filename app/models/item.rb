class Item < ApplicationRecord
  belongs_to :user

  # validates :item_name, presence: true
  # validates :description, presence: true
  # validates :price, presence: true
end
