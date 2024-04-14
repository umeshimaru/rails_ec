# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cart_products, only: %i[index new destroy create] do
    member do
      post :create
    end
  end
  resources :customers, only: %i[new create]
  root 'products#index'
  resources :products, only: %i[index show]
  namespace :admin do
    resources :products
  end
end
