Rails.application.routes.draw do



  root "products#index"

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

end
