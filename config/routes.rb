Rails.application.routes.draw do
  devise_for :users
  
  root to: 'top#index'
  get "category" => "categories#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts, only: %i[new create edit update destroy]
  resources :another_posts, only: %i[new create edit update destroy]
  resources :articles, only: [:index]
end
