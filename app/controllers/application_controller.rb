# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :cart_products_number

  private

  def cart_products_number
    @customer = Customer.find_by(id: cookies.signed[:customer_id])
    @your_cart_products = if @customer
                            @customer.cart_products
                          else
                            []
                          end
  end
end
