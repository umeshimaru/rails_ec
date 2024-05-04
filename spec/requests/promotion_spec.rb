# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Promotions', type: :request do
  describe 'GET /create' do
    it 'returns http success' do
      get '/promotion/create'
      expect(response).to have_http_status(:success)
    end
  end
end
