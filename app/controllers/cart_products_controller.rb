# frozen_string_literal: true

class CartProductsController < ApplicationController
  before_action :set_customer, only: %i[create index destroy]

  def index
    @cart_products = @cart.cart_products
    if @cart_products.empty?
      redirect_to products_path, flash: { danger: 'カートに商品を追加してください' }
      return
    end
    @customer = Customer.new
    @discount_amount = session[:code] ? Promotion.find_by(code: session[:code]).discount_amount : 0
  end

  def create
    quantity = params[:quantity].nil? ? 1 : params[:quantity].to_i
    @your_cart_product = @cart.cart_products.find_or_initialize_by(product_id: params[:id]) do |cart|
      cart.quantity = quantity
    end

    @your_cart_product.quantity += quantity if @your_cart_product.id

    if @your_cart_product.save
      redirect_to products_path, flash: { primary: 'カートに追加しました' }
    else
      redirect_to products_path, flash: { danger: 'カートに追加できませんでした' }
    end
  end

  def destroy
    cart_product = @cart.cart_products.find_by(product_id: params[:id])
    return unless cart_product.delete

    redirect_to cart_products_path, flash: { danger: '商品をカートから削除しました' }
  end

  private

  def set_customer
    @cart = Cart.find_or_create_by(id: cookies.signed[:cart_id])
    cookies.permanent.signed[:cart_id] = @cart.id if cookies.permanent.signed[:cart_id].nil?
  end
end
