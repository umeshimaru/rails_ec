# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :cart_products_number

  private

  def cart_products_number
    @cart = Cart.find_by(id: cookies.signed[:cart_id])
    @your_cart_products = if @cart
                            @cart.cart_products
                          else
                            []
                          end
  end
end
