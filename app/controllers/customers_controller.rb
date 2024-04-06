class CustomersController < ApplicationController

  def new
  end

  def create
    if Customer.find_by(id: cookies.signed[:customer_id])
      redirect_to customers_new_path
    else
      customer = Customer.create
      cookies.permanent.signed[:customer_id] = customer.id
    end
  end






# @customer = Customer.new
# puts params
# if @customer.save(customer_params)
# redirect_to  product_path(2)
# end
end
