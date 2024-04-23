class CustomerMailer < ApplicationMailer
  helper MailHelper
  def send_invoice
    @customer = params[:customer]
    @purchased_products = @customer.purchased_products
    mail(to: @customer.email, subject: '購入ありがとうございます')
  end
end
