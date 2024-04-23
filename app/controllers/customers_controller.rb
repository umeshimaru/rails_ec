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

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully updated." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
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
