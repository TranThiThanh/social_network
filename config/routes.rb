Rails.application.routes.draw do
  root "sessions#new"
  get "/login", to: "sessions#new"

end

