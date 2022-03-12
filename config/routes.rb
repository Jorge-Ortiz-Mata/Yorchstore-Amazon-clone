Rails.application.routes.draw do

  # Orders resources.
  get 'add_to_my_car', to: 'orders#create'
  get 'remove_from_my_car', to: 'orders#destroy'

  # Profile resources.
  resources :profiles

  # Users resources.
  devise_for :users

  # Articles resources.
  resources :articles

  # Root path.
  root 'pages#home'
  
end
