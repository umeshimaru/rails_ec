class Admin::ProductsController < ApplicationController
    before_action :edit_product, only: [:edit, :update]
  def new
  end

  def create
  end

  def edit
  end

  def update
   if @product.update(product_params)
    redirect_to  admin_products_path,flash:{success: "更新完了"}
   else
    render :edit, status: :unprocessable_entity
   end 
  end

  def delete
  end

  private

    def product_params
      params.require(:product).permit(:name, :price,:product_code,:description,:image)
    end

    def edit_product
      @product = Product.find(params[:id])
    end
end
