Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
      resources :events, only: [:index, :create, :destroy]
      resources :comments, only: [:create]
      resources :designers, only: [:create, :destroy]
      post '/signup', to: 'users#create'
      post '/login', to: 'auth#create'
      post '/current_user', to: 'auth#show'
      post '/get_event', to: 'events#show'
    end
  end
end
