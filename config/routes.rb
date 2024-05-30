Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :api do 
    namespace :v0 do 
      resources :plants, only: [:index, :create]

      get "/users/:user_id/plants", to: "user_plants#index"
      get "/users/:user_id/plants/:id", to: "user_plants#show"
      
      post "/sign_in", to: "sign_in#sign_in"
      delete "/sign_out", to: "sign_out#sign_out"
    end
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
