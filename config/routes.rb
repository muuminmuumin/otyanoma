Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:edit, :update]

  resources :contents
  
  root "contents#index"
  
  
  


end