# frozen_string_literal: true

module CartProductsHelper
  def calc_total_price(cart_products, discount_amount)
    total_price_array = cart_products.map { |cart_product| cart_product.product.price * cart_product.quantity }
    total_price_array.sum - discount_amount
  end
end
