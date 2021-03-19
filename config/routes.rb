# frozen_string_literal: true

Rails.application.routes.draw do
  root "users_type#taker"

  get 'users/taker', to: 'users_type#taker'
  get 'users/owner', to: 'users_type#owner'
  get 'carts/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products do
    resources :avatars, only: [:create]
    resources :likes
  end
  resources :line_products
  resources :carts
  resources :users
  resources :orders
  resources :order_products

  scope '/checkout' do
    resources :checkout, only: [:create]
    get "success", to: 'checkout#success', as: "checkout_success"
  end
  get 'static_pages/faq'
  get 'static_pages/legal_mention'
  get 'static_pages/contact'
end
