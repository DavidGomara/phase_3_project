Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root(to: "static#home")

  get "/signup", to: "users#signup", as: "signup"
  post "/signup", to: "users#create"

  get "/logout", to: "sessions#logout", as: "logout"
  get "/login", to: "sessions#login", as: "login"
  post "/login", to: "sessions#create"

  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get, :post]
  
  resources :artists do
    resources :reviews, only: [:edit, :update, :new, :create]
    resources :albums do
      resources :reviews, only: [:edit, :update, :new, :create]
      resources :songs do
        resources :reviews, only: [:edit, :update, :new, :create]
      end 
    end 
  end 

end
