# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image
  has_many :cart_products, dependent: :destroy
  has_many :cart, through: :cart_products

  scope :related_products, -> { order(created_at: :desc).limit(5) }

  validates :name,         presence: true, uniqueness: true, length: { maximum: 255 }
  validates :price,        presence: true, numericality: { only_integer: true }
  validates :product_code, presence: true, uniqueness: true, length: { maximum: 255 },
                           format: { with: /\A[a-zA-Z0-9]+[a-zA-Z0-9]+[a-zA-Z0-9]+\z/ }
  validates :description, presence: true
  validates :image, presence: true, blob: { content_type: :image }
end
