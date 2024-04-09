class CartProductsController < ApplicationController
  def index
  end

  def new
  end

  def create
    customer = Customer.find_by(id: cookies.signed[:customer_id])
    if customer.nil?
      customer = Customer.create
      cookies.permanent.signed[:customer_id] = customer.id
      customer.cart_products.create(cart_product_params)
      redirect_to products_path, flash: { primary: "カートに追加しました" }
    else
      customer.cart_products.create(cart_product_params)
      redirect_to products_path, flash: { primary: "カートに追加しました" }
    end
  end

  def destroy
  end

  private

def cart_product_params
  permit_params = params.require(:cart_product).permit(:product_id,:quantity)
  permit_params.merge(customer_id: cookies.signed[:customer_id])
end 
end
