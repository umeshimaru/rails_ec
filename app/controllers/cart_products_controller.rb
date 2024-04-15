# frozen_string_literal: true

class CartProductsController < ApplicationController
  before_action :set_customer, only: %i[create index destroy]

  def index
    @cart_products = @customer.cart_products
  end

  def new; end

  def create
    quantity = params[:quantity].nil? ? 1 : params[:quantity].to_i
    @your_cart_product = @customer.cart_products.find_by(product_id: params[:id])

    if @your_cart_product.nil?
      @your_cart_product = @customer.cart_products.new(product_id: params[:id],
                                                       quantity:)
    else
      @your_cart_product.quantity += quantity
    end

    if @your_cart_product.save
      redirect_to products_path, flash: { primary: 'カートに追加しました' }
    else
      redirect_to products_path, flash: { primary: 'カートに追加できませんでした' }
    end
  end

  def destroy
    cart_product = @customer.cart_products.find_by(product_id: params[:id])
    return unless cart_product.delete

    redirect_to cart_products_path, flash: { danger: '商品をカートから削除しました' }
  end

  private

  def set_customer
    @customer = Customer.find_or_create_by(id: cookies.signed[:customer_id])
    cookies.permanent.signed[:customer_id] = @customer.id if @customer.id.nil?
end 
end