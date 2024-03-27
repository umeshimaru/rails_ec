class Admin::ProductsController < ApplicationController
    before_action :find_product, only: %i[edit update destroy]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
        redirect_to admin_products_path,flash :{primary: "登録完了"}
      else
        render :new, status: :unprocessable_entity
    end
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

  def destroy
    @product.destroy
    redirect_to  admin_products_path,flash:{danger: "削除完了"}
  end

  private

    def product_params
      params.require(:product).permit(:name, :price,:product_code,:description,:image)
    end

    def find_product
      @product = Product.find(params[:id])
    end

end
