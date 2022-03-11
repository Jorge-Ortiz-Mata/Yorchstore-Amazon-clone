Rails.application.routes.draw do

  #get 'addToCar', to: 
  get 'addCar', to: 'articles#addCar'

  # Profile resources.
  resources :profiles

  # Users resources.
  devise_for :users

  # Articles resources.
  resources :articles

  # Root path.
  root 'pages#home'
  
end
