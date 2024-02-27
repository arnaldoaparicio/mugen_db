Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :characters, only: [:index, :show, :create, :update]
      resources :fighters, only: [:create]
      resources :fighter_variants, only: [:create]
      resources :users, only: [:create, :show]
    end
  end
  get '/api/v1/characters/:series_id/:fighter_id', to: 'api/v1/characters#index'
  post '/api/v1/login', to: 'api/v1/users#login'
  patch '/api/v1/characters/:series_id/:fighter_id', to: 'api/v1/fighters#update'
  patch '/api/v1/characters/:series_id/:fighter_id/:fighter_variant_id', to: 'api/v1/fighter_variants#update'
  # post '/api/v1/fighter_variants', to: 'api/v1/fighter_variants#create'
  # post '/api/v1/fighters', to: 'api/v1/fighters#create'
end
