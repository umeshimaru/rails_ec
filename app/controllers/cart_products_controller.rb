class CartProductsController < ApplicationController
  before_action :set_customer ,only:[:create ,:index]
  def index
@cart_products = @customer.cart_products
  end

  def new
  end


  def create
    #indexページのadd to cartがクリックされた時かshowから追加されたか判定するため場合
    quantity =  params[:quantity].nil? ? 1 : params[:quantity]
      
    @your_cart_products = @customer.cart_products.find_by(product_id: params[:id])

 if @your_cart_products.nil?
 @your_cart_product = @customer.cart_products.new(product_id:params[:id],
    quantity: quantity)
 else
  @your_cart_product.quantity += quantity
 end

 if @your_cart_product.save
  redirect_to products_path, flash: { primary: "カートに追加しました" }
 else
  redirect_to products_path, flash: { primary: "カートに追加できませんでした" }
 end
    # @customer.cart_products.create(cart_product_params)
    # redirect_to products_path, flash: { primary: "カートに追加しました" }
  end

  def destroy
  end

  private



def set_customer
  @customer = Customer.find_by(id: cookies.signed[:customer_id])
  if @customer.nil?
    @customer = Customer.create
    cookies.permanent.signed[:customer_id] = @customer.id
  end
end

end
