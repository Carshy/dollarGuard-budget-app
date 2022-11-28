Rails.application.routes.draw do
  get 'homes/index'
  
  devise_for :users, sign_out_via: [:get, :post]
  
  root 'homes#index'
  resources :categories
  resources :transfers

  devise_scope :user do
    root to: 'devise/sessions#splash', as: :splash_root
  end
end
