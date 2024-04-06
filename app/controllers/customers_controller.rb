class CustomersController < ApplicationController

  def new
  end

  def create
    if Customer.find_by(id: cookies.signed[:customer_id])
      
    else
      customer = Customer.create
      cookies.permanent.signed[:customer_id] = customer.id
    end
  end

private

def cart_product_params
  params.require(:cart_product).permit(:quantity)
end 




end
