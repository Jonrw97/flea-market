class Item < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_one :receipt
  has_maney :bids
  validates :item_name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true
  has_one_attached :photo
  validates :photo, presence: true
  pg_search_scope :search_by_item_name_and_description,
  against: [ :item_name, :description ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
