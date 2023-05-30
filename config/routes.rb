Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :transactions, only: [:new, :create, :index, :show]
  resources :categories, only: [:index, :show, :new, :create] do
    resources :transactions, only: [:index, :show]
  end

  # Defines the root path route ("/")
  root "categories#index"
end