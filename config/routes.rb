Rails.application.routes.draw do

  # Products routes.
  get 'my_products', to: 'products#index'

  # Orders resources.
  get 'car', to: 'orders#car'
  get 'buy', to: 'orders#buy'
  get 'add_to_my_car', to: 'orders#create'
  delete 'remove_from_my_car', to: 'orders#destroy'

  # Profile resources.
  resources :profiles

  # Users resources.
  devise_for :users

  # Articles resources.
  resources :articles

  # Root path.
  root 'pages#home'
  
end
