Rails.application.routes.draw do
  root "sessions#new"
  get "/login", to: "sessions#new"


  get "/about", to: "static_pages#about"

  get "/help", to: "static_pages#contact_help"

  get "/privacy", to: "static_pages#privacy"

  get "/terms", to: "static_pages#terms"

end
