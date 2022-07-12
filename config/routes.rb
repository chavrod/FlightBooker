Rails.application.routes.draw do
  resources :bookings, only: %i[new create show]
  resources :flights, only: %i[index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'flights#index'
end
