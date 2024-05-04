# frozen_string_literal: true

class PromotionsController < ApplicationController
  def create
    unless Promotion.exists?(code: params[:code])
      redirect_to cart_products_path, flash: { danger: '無効なコードです' }
      return
    end

    promotion_code = Promotion.find_by(code: params[:code])

    if promotion_code.customer_id?
      redirect_to cart_products_path, flash: { danger: 'そのコードはすでに使用されています' }
    else
      session[:code] = params[:code]
      redirect_to cart_products_path, flash: { primary: '割引が適用されました' }
    end
  end
end
