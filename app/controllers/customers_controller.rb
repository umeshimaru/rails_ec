# frozen_string_literal: true

class CustomersController < ApplicationController
   before_action :set_customer, only: %i[create]

  def create
    @customer = Customer.new(customer_params)
    begin
      ActiveRecord::Base.transaction do
        if @customer.save
          create_purchased_products
          CustomerMailer.with(customer: @customer).send_invoice.deliver_now
          clear_session
          redirect_to products_path, flash: { primary: '購入ありがとうございます' }
        else
          flash.now[:danger] = '購入できませんでした'
          @cart_products = @cart.cart_products
          render 'cart_products/index', status: :unprocessable_entity
        end
      end
    rescue StandardError
      clear_session
      redirect_to products_path, flash: { danger: '購入処理に失敗しました、最初からやり直してください。' }
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :user_name, :email, :address, :address2, :pref, :city,
                                     :zip, :credit_name, :credit_number, :credit_expiration, :credit_cvv)
  end

  def create_purchased_products
    @cart.products.each do |product|
      @customer.purchased_products.create!(
        name: product.name,
        price: product.price,
        quantity: product.cart_products.first.quantity,
        description: product.description
      )
    end
  end

  def clear_session
    session[:cart_id] = nil
    @cart.destroy
  end

    def set_customer
      @cart = Cart.find_or_create_by(id: cookies.signed[:cart_id])
  end
end
