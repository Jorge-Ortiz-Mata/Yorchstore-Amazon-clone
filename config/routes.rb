Rails.application.routes.draw do

  # Products routes.
  get 'my_products', to: 'products#index'

  # Orders resources.
  get 'add_to_my_car', to: 'orders#create'
  get 'remove_from_my_car', to: 'orders#destroy'
  get 'car', to: 'orders#car'

  # Profile resources.
  resources :profiles

  # Users resources.
  devise_for :users

  # Articles resources.
  resources :articles

  # Root path.
  root 'pages#home'
  
end
