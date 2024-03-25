# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image, service: :amazon

  scope :related_products, -> { order(created_at: :desc).limit(5) }

  validates :name,         presence: true, uniqueness: true, length: { maximum: 255 }
  validates :price,        presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true }
  validates :product_code, presence: true, uniqueness: true,length: { maximum: 255 }
  validates :description,  presence: true



end
