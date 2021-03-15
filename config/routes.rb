Rails.application.routes.draw do

  root "static_page#index"
 
  get 'carts/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products
  resources :line_products
  resources :carts
  resources :users


end
