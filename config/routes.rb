Rails.application.routes.draw do
  
  resources :events
  get 'topics/new'
  get 'sessions/new'
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resource :user
  resources :topics do
    resources :comments
    post '/favorites', to: 'favorites#create'
    delete '/favorites', to: 'favorites#destroy'
  end
  
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'favorites/index'
end
