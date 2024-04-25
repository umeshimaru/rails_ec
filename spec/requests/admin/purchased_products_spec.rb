# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::PurchasedProducts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/admin/purchased_products/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/admin/purchased_products/show'
      expect(response).to have_http_status(:success)
    end
  end
end
