# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products
end
