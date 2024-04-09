class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  scope :get_products, ->(customer) {joins(:product).select("cart_products.*, products.*").where(customer_id: customer)}
  validates :quantity, presence: true,  numericality: { in: 0..100 }
end
