Rails.application.routes.draw do
  resources :messages
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    get 'messages/random', to: 'messages#random'
  end
  # Defines the root path route ("/")
  root "messages#index"
end
