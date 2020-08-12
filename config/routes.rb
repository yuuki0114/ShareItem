Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :users, only: [:index, :show]
  resources :items, only: [:new, :create, :show]
  resources :credit_cards, only: [:new, :create] 
end
