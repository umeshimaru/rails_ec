# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'
  scope 'admin' do
    resources :products, only: %i[index show],as: 'admin_products'
  end
  resources :products, only: %i[index show]
end
