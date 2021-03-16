Rails.application.routes.draw do



  root "users_type#taker"

  get 'users/taker', to: 'users_type#taker'
  get 'users/owner', to: 'users_type#owner'
  get 'carts/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products do
    resources :avatars, only: [:create]
  end
  resources :line_products
  resources :carts
  resources :users

   resources :checkout, only: [:create]
   get 'static_pages/faq'
   get 'static_pages/legal_mention'

end
