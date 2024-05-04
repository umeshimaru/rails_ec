# frozen_string_literal: true

class CustomerMailer < ApplicationMailer
  helper MailHelper
  def send_invoice
    @customer =  params[:customer]
    @promotion = params[:promotion]
    @purchased_products = @customer.purchased_products
    @discount_amount = @promotion ? @promotion.discount_amount : 0
    mail(to: @customer.email, subject: '購入ありがとうございます')
  end
end
