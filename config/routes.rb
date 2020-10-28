Rails.application.routes.draw do
  
  root "contents#show"

  resources :contents, only: [:index, :show]


end