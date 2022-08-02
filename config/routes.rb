Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :characters, only: [:index, :show, :create]
    end
  end
  get "/api/v1/characters/:series_id/:fighter_id", to: "api/v1/characters#index"
  post "/api/v1/fighter_variants", to: "api/v1/fighter_variants#create"
end
