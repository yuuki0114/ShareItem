Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :users, only: [:index, :show]
  resources :items, only: [:new, :create, :show, :destroy] do
    member do
      post 'pay'
    end
  end
  resources :credit_cards, only: [:new, :create, :destroy] 
end
