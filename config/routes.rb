Rails.application.routes.draw do
  root "users#new"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/signup", to: "users#create"
  get "/about", to: "static_pages#about"
  get "/help", to: "static_pages#contact_help"
  get "/privacy", to: "static_pages#privacy"
  get "/terms", to: "static_pages#terms"
  get "password_resets/new"
  get "password_resets/edit"
  resources :users
  resources :account_activations, only: [:edit]
  resources :profile, only: [:show, :index]
  resources :relationship, only: [:create, :update, :destroy]
  resources :password_resets, except: [:index, :destroy, :show]
  resources :profile, only: [:show]
  resources :conversations do
    resources :messages
  end
  resources :groups
  resources :group_users
  resources :posts
  resources :comments
  resources :invites
  resources :likes
end
