class CustomersController < ApplicationController

  def new
  end

  def create
    customer = Customer.find_by(id: cookies.signed[:customer_id])
    if customer.nil?
      customer = Customer.create
      cookies.permanent.signed[:customer_id] = customer.id
      customer.cart_products.create(cart_product_params)
    else
      customer.cart_products.create(cart_product_params)
    end
  end

private

def cart_product_params
  permit_params = params.require(:cart_products).permit(:product_id,:quantity)
  permit_params.merge(customer_id: cookies.signed[:customer_id])
end 




end
