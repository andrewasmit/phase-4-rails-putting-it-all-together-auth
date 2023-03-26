Rails.application.routes.draw do

  post "/signup", to: "signup#create"
  get "/me", to: "user#show"
  post "/login", to: "session#create"
  delete "logout", to: "session#destroy"
  get "/recipes", to: "recipe#index"
  post "/recipes", to: 'recipe#create'
end
