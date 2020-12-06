Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: 'logout'

  get '/auth/:provider/callback' => 'sessions#google_login'
  
  resources :reviews
  resources :repairs  do 
    resources :reviews, only: [:new, :index]
  end

  resources :users, only: [:show]
end