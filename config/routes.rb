Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #Authentication
  delete '/authentication/logout', to: "authentication#logout_account"
  post 'authentication/register', to: "authentication#create"
  post 'authentication/login', to: "authentication#login"
end
