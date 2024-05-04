# frozen_string_literal: true

module MailHelper
  def calc_mail_total_price(purchased_products, discount_amount)
    total_price_array = purchased_products.map { |purchase_product| purchase_product.price * purchase_product.quantity }
    total_price_array.sum - discount_amount
  end

  def calc_mail_total_quantity(purchased_products)
    total_quantity_array = purchased_products.map(&:quantity)
    total_quantity_array.sum
  end
end
