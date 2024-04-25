# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  resources :customers
  resources :cart_products, only: %i[index new destroy create] do
    member do
      post :create
    end
  end
  resources :carts, only: %i[new create]
  root 'products#index'
  resources :products, only: %i[index show]

  namespace :admin do
    resources :cart_products, only: %i[index]
    resources :products
    resources :custom
    resources :purchased_products, only: %i[index show]
  end
end
