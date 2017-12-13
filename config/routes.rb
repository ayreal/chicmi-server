Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :update, :show]
      resources :designers, only: [:index]
      resources :events, only: [:index, :create, :show]
      resources :comments, only: [:index, :create, :update, :destroy]

    end
  end
end
