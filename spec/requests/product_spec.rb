# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/product/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/product/show'
      expect(response).to have_http_status(:success)
    end
  end
end
