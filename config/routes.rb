Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    get "brands" => "brand#get_all"
    get "brands/:id" => "brand#get_by_id"
    get "products" => "product#get_all"
    get "products/:id" => "product#get_by_id"
    post "issue" => "issue#create"
    get "cards/:id" => "card#get_by_id"
  end
end
