Rails.application.routes.draw do
  root 'landing#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/register', to: 'users#new'
  get '/dashboard', to: 'users#show'

  resource :users, only: [:create]
  resources :discover, only: [:index]
  resources :movies, only: [:index, :show] do
    resources :parties, only: [:new, :create]
  end
end
