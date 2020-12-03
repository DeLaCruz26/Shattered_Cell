Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: 'logout'

  resources :repairs  do 
    resources :devices, only: [:new, :index, :show]
  end

  resources :users, only: [:new, :create, :show] do 
    resources :repairs
  end

  resources :devices
end