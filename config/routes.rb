Rails.application.routes.draw do
  root "sessions#login"
  get "/login", to: "sessions#login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/about", to: "static_pages#about"
  get "/help", to: "static_pages#contact_help"
  get "/privacy", to: "static_pages#privacy"
  get "/terms", to: "static_pages#terms"
  resources :users
end
