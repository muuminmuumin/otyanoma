Rails.application.routes.draw do
  
  root "contents#index"

  resources :contents, only: [:index, :show, :new]


end