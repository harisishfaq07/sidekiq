Rails.application.routes.draw do
  resources :blogs
  resources :articles
  require 'sidekiq/web'
  root 'homepage#report'
  post 'homepage/generate'

  mount Sidekiq::Web => '/sidekiq' # Replace '/your-custom-path' with the desired URL path
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
