class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  # scope :get_products, ->(customer) {joins(:product,:customer).select("cart_products.*, products.*,customers.*").where(customer_id: customer).group(:cart_products.name).sum(:quantity)}
  validates :quantity, presence: true,  numericality: { in: 0..100 }
end
