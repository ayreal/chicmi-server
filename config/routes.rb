Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :update, :show]
      resources :designers, only: [:index]
      resources :events, only: [:index, :create, :show, :destroy]
      resources :comments, only: [:index, :create, :update, :destroy]
      post '/login', to: 'auth#create'
      post '/current_user', to: 'auth#show'
    end
  end
end
