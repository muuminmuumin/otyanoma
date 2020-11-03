Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:edit, :update]

  resources :contents, only: [:index, :show, :new]
  
  root "contents#index"
  
  
  


end