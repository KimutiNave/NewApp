Rails.application.routes.draw do
  devise_for :users

  # 退会確認画面
  get '/users/:id/check' => 'users#check', as: 'check'
  # 論理削除用のルーティング
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  
  root to: 'homes#home'
  get "top" => 'top#index'
  get "policy" => "top#policy"
  get "category" => "categories#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts, except: [:show ] do
    get :search, on: :collection
  end
  resources :another_posts, except: [:show ] do
    get :search, on: :collection
  end
  resources :notification_settings
end
