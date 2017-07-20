Rails.application.routes.draw do
  root "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/about", to: "static_pages#about"
  get "/help", to: "static_pages#contact_help"
  get "/privacy", to: "static_pages#privacy"
  get "/terms", to: "static_pages#terms"
  post "/signup", to: "users#create"
  delete "/logout",  to: "sessions#destroy"
  get "/friends", to: "users#friends"
  resources :users
  resources :account_activations, only: [:edit]
  resources :profile, only: [:show, :index]
  resources :relationship, only: [:create, :update, :destroy]
end
