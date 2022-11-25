Rails.application.routes.draw do
  get 'sessions/new'
  # make /signup as the standard url to go to the users#new page
  get "signup" => "users#new"
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  get "/auth/:provider/callback" => "authentications#create"
  get "/search", to: "jobs#search"
  
  # disable users from accessing index and about if they are not logged in
  resources :users, except: [:index, :about]
  resources :sessions, except: [:index, :edit, :edit, :show, :new, :destroy]
  resources :jobs do
    resources :reviews
  end
  resources :passwords
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about" => "sites#about"
  # Defines the root path route ("/")
  root "sites#index"
end
