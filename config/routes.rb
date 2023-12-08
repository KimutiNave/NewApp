Rails.application.routes.draw do
  get 'top/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts
end
