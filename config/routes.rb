Rails.application.routes.draw do
  resources :profiles
  devise_for :users

  # Articles resources.
  resources :articles

  # Root path.
  root 'pages#home'
  
end
