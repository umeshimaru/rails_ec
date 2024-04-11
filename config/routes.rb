# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cart_products, only: [:index, :new, :destroy,:create] do 
    member do
      post :create
    end
  end
  resources :customers,only: [:new, :create]
  root 'products#index'
  resources :products, only: %i[index show]
  namespace :admin do
    resources :products
  end

end
