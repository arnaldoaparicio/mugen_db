Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :characters, only: [:index, :show]
    end
  end
  get "/api/v1/characters/:series_id/:fighter_id", to: "api/v1/characters#index"
end
