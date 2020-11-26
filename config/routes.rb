Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :techs  do 
    resources :repairs, only: [:index, :new, :create]
  end

  resources :customers do 
    resources :repairs, only: [:index]
  end
end