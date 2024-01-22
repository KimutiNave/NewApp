Rails.application.routes.draw do
  root to: 'top#index'
  get "category" => "categories#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts
  resources :another_posts
end
