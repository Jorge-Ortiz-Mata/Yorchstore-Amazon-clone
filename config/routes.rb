Rails.application.routes.draw do

  # Articles resources.
  resources :articles

  # Root path.
  root 'pages#home'
  
end
