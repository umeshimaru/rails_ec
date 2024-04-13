# frozen_string_literal: true

class ProductsController < ApplicationController
  
  def index
    @products = Product.with_attached_image
  end

  def show
    @product = Product.find(params[:id])
    @suggested_products = Product.related_products
  end
end
