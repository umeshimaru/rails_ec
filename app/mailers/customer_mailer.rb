# frozen_string_literal: true

class CustomerMailer < ApplicationMailer
  helper MailHelper
  def send_invoice
    @customer = params[:customer]
    @purchased_products = @customer.purchased_products
    @discount_amount = @customer.promotion.customer_id ? @customer.promotion.discount_amount : 0
    mail(to: @customer.email, subject: '購入ありがとうございます')
  end
end
