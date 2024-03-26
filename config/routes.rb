# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: %i[index show]


  namespace :admin do
    resources :products,only: %i[new create edit update destroy]
  end
  scope 'admin' do
    resources :products, only: %i[index show],as: 'admin_products'
  end


 

 



end
