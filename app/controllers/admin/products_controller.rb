class Admin::ProductsController < ApplicationController
  def new
  end

  def create
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
   
  end

  def delete
  end
end
