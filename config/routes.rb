Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/new'
  get 'categories/edit'
  get 'top/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts
end
