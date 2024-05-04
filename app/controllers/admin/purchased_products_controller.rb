# frozen_string_literal: true

module Admin
  class PurchasedProductsController < ApplicationController
    before_action :basic_auth

    def index
      @customers = Customer.all
    end

    def show
      customer = Customer.find(params[:id])
      @purchase_products = customer.purchased_products
      @discount_amount = customer.promotion ? customer.promotion.discount_amount : 0
    end

    private

    def basic_auth
      return unless Rails.env.development?

      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['ADMIN'] && password == ENV['BASIC_PASSWORD']
      end
    end
  end
end
