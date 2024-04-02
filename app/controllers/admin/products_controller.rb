# frozen_string_literal: true

module Admin
  class ProductsController < ApplicationController
    before_action :basic_auth
    before_action :set_product, only: %i[edit update destroy show]

    def index
      @products = Product.all.with_attached_image
    end

    def show
      @suggested_products = Product.related_products
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_products_path, flash: { primary: '登録完了' }
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @product.update(product_params)
        redirect_to admin_products_path, flash: { success: '更新完了' }
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @product.destroy
      redirect_to admin_products_path, flash: { danger: '削除完了' }
    end

    private

    def product_params
      params.require(:product).permit(:name, :price, :product_code, :description, :image)
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def basic_auth
      return unless Rails.env.development?

      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['ADMIN'] && password == ENV['BASIC_PASSWORD']
      end
    end
  end
end
