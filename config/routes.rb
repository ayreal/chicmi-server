Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :update, :show]
      resources :designers, only: [:index]
      resources :events, only: [:index, :create, :destroy]
      resources :comments, only: [:index, :create, :update, :destroy]
      post '/login', to: 'auth#create'
      post '/current_user', to: 'auth#show'
      post '/new_event', to: 'events#show'
      post '/get_event', to: 'events#index'
    end
  end
end
