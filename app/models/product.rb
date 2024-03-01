class Product < ApplicationRecord
  has_one_attached :image

  scope :related_products, -> { order(created_at: :desc).limit(5) }
end
