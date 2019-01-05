Rails.application.routes.draw do
  resources :mood_logs
  resources :moods
  resources :users

  get "/signup", to: "users#new" #, as "signup" #currently new_user_path
  
  get "/login", to: "sessions#new", as: "login"
  get "/logout", to: "sessions#destroy", as: "logout"
  post "/sessions", to: "sessions#create"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
