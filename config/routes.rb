Rails.application.routes.draw do
  root 'landing#index'

  get '/register', to: 'users#new'
  # post '/register', to: 'users#create'

  resources :users, only: [:show, :create] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show] do
      resources :parties, only: [:new, :create]
    end
  end
end
