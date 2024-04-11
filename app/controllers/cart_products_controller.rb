class CartProductsController < ApplicationController
  before_action :set_customer ,only:[:create ,:index]
  def index

  end

  def new
  end


  def create
    #indexページのadd to cartがクリックされた時かshowから追加されたか判定するため場合
    quantity = if params[:quantity].nil?
      1
    else
      params[:quantity]
     end
     puts quantity
    # cart_product = @custoemr.cart_products.find_by(product_id: params[:cart_product][:product_id])
#  if cart_product
# cart_product.quantity = quantity
#  else
#   @customer.cart_products.new(product_id:params[:cart_product][:product_id],quantity: quantity)
#  end
#  if 
    # @customer.cart_products.create(cart_product_params)
    # redirect_to products_path, flash: { primary: "カートに追加しました" }
  end

  def destroy
  end

  private

def cart_product_params
  permit_params = params.require(:cart_product).permit(:product_id,:quantity)
  permit_params.merge(customer_id: cookies.signed[:customer_id])
  # puts a[:quantity] =+ 1000

  # puts params[:cart_product][:quantity] = 1
end 

def set_customer
  @customer = Customer.find_by(id: cookies.signed[:customer_id])
  if @customer.nil?
    @customer = Customer.create
    cookies.permanent.signed[:customer_id] = @customer.id
  end
end

end
