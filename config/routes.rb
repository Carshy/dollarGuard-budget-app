Rails.application.routes.draw do
  
  devise_for :users, sign_out_via: [:get, :post]
  
  root 'categories#index'
  resources :categories
end
