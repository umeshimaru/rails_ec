class CustomersController < ApplicationController

  def new
  end

  def create
    customer = Customer.find_by(id: cookies.signed[:customer_id])
    if customer.nil?
      customer = Customer.create
      cookies.permanent.signed[:customer_id] = customer.id
    else
      cart_product = customer.cart_products.new(cart_product_params)
      if cart_product.save
        redirect_to customers_new_path
      end
    end
  end

private

def cart_product_params
  permit_params = params.require(:cart_product).permit(:product_id,:quantity)
  permit_params.merge(customer_id: cookies.signed[:customer_id])
end 




end
