class CartProductsController < ApplicationController
  before_action :new_cutomer? ,only:[:create]
  def index
    @customer = Customer.find_by(id: cookies.signed[:customer_id])
    @customer.products
  end

  def new
  end

  def create
    @customer.cart_products.create(cart_product_params)
    redirect_to products_path, flash: { primary: "カートに追加しました" }
  end

  def destroy
  end

  private

def cart_product_params
  permit_params = params.require(:cart_product).permit(:product_id,:quantity)
  permit_params.merge(customer_id: cookies.signed[:customer_id])
end 

def new_cutomer?
  @customer = Customer.find_by(id: cookies.signed[:customer_id])
  if @customer.nil?
    @customer = Customer.create
    cookies.permanent.signed[:customer_id] = @customer.id
  else
    @customer
  end
end

end
