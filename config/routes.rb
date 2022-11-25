Rails.application.routes.draw do
  # get 'transfers/new'
  # get 'transfers/create'
  
  devise_for :users, sign_out_via: [:get, :post]
  
  root 'categories#index'
  resources :categories
  resources :transfers
end
