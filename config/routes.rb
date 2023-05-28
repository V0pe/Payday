Rails.application.routes.draw do
  resources :transactions, only: [:index, :show, :new, :create]
  resources :categories, only: [:index, :show, :new, :create]
  resources :users, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "categories#index"
end
