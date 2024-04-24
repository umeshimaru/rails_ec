class CustomersController < ApplicationController
  before_action :set_customer, only: %i[index]



  def create
    @customer = Customer.new(customer_params)
    if @customer.save 
      create_purchased_products
      @cart.destroy
      redirect_to   products_path, flash: { primary: '購入ありがとうございます' }
      CustomerMailer.with(customer: @customer).send_invoice.deliver_now
      else
      @cart_products = @cart.cart_products
      flash.now[:danger] = "購入できませんでした"
      render "cart_products/index", status: :unprocessable_entity
    end
  end

  end




  end

  private
  
  

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :user_name, :email, :address, :address2, :pref, :city, :zip, :credit_name, :credit_number, :credit_expiration, :credit_cvv)
    end

    def set_customer
      @cart = Cart.find_by(id: cookies.signed[:cart_id])
    end

    def create_purchased_products
      @cart.products.each do |product|
        @customer.purchased_products.create(
          name: product.name,
          price: product.price,
          quantity: product.cart_products.first.quantity,
          description: product.description
        )
      end
    end
    
   

end
