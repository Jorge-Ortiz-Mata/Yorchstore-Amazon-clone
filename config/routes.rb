Rails.application.routes.draw do



  # Profile resources.
  resources :profiles

  # Users resources.
  devise_for :users

  # Articles resources.
  resources :articles

  # Root path.
  root 'pages#home'
  
end
