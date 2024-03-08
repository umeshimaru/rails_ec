# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'product/index'
  get 'product/show/:id', to: 'product#show', as: 'product_show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
