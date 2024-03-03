# frozen_string_literal: true

class ProductController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @suggested_products = Product.related_products
  end
end
