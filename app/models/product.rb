# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image

  scope :related_products, -> { order(created_at: :desc).limit(5) }

  validates :name,         presence: true, uniqueness: true, length: { maximum: 255 }
  validates :price,        presence: true, numericality: { only_integer: true }
  validates :product_code, presence: true, uniqueness: true,length: { maximum: 255 },format: { with: /\A[0-9]+\z/ }
  validates :description,  presence: true



end
