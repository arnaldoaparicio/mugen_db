Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :characters, only: [:index, :show, :create]
      resources :fighters, only: [:create]
      resources :fighter_variants, only: [:create]
      resources :users, only: [:create]
    end
  end
  get '/api/v1/characters/:series_id/:fighter_id', to: 'api/v1/characters#index'
  post '/api/v1/login', to: 'api/v1/users#login'
  # post '/api/v1/fighter_variants', to: 'api/v1/fighter_variants#create'
  # post '/api/v1/fighters', to: 'api/v1/fighters#create'
end
