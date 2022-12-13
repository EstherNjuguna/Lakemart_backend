Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #Authentication
  delete '/authentication/logout', to: "authentication#logout"
  post 'authentication/register', to: "authentication#create"
  post 'authentication/login', to: "authentication#login"
#Product
post "/products/create" , to: "products#create"

end
