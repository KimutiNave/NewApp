Rails.application.routes.draw do
  devise_for :users
  
  root to: 'top#index'
  get "category" => "categories#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts, except: [:show ] do
    get :search, on: :collection
  end
  resources :another_posts, except: [:show ] do
    get :search, on: :collection
  end
end
