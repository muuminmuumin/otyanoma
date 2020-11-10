Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:edit, :update]

  resources :contents do
    resources :comments, only: :create
  end  
  root "contents#index"
  
  
  


end