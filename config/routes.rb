Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  get "/products" => "products#index"
  post "/products" => "products#create"
  get "/products/:id" => "products#show"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  get "/orders" => "orders#index"
  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"

  get "/suppliers" => "suppliers#index"
  get "/suppliers/:id" => "suppliers#show"

  get "images" => "images#index"

  get "/carted_products" => "carted_products#index"
  post "/carted_products" => "carted_products#create"
  delete "/carted_products/:id" => "carted_products#destroy"
end
