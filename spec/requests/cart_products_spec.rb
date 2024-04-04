require 'rails_helper'

RSpec.describe "CartProducts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/cart_products/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/cart_products/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/cart_products/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
