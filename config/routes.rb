Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:edit, :update]

  resources :contents, only: [:index, :show, :new, :create]
  
  root "contents#index"
  
  
  


end