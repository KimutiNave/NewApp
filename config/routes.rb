Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions', passwords: 'users/passwords',  omniauth_callbacks: 'users/omniauth_callbacks' }
  
  # 退会確認画面
  get '/users/:id/check' => 'users#check', as: 'check'
  # 論理削除用のルーティング
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

  # 名前の確認用
  devise_scope :user do
    get '/users/name_confirm' => 'users#name_confirm', as: 'name_confirm'
    get '/users/name_check' => 'users#name_check', as: 'name_check'
    get '/users/:id/name_check' => 'users#name_check', as: 'show_name_check'
    post '/users/name_check' => 'users#name_check', as: 'create_name_check'
    delete '/users/:id/name_check' => 'users#name_check', as: 'destroy_name_check'
  end

  root to: 'homes#home'
  get "top" => 'top#index'
  get "policy" => "top#policy"
  get "category" => "categories#index"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts do
    get :search, on: :collection
    collection do
      get :bookmarks
    end
  end
  resources :bookmarks, only: %i[create destroy]
  resources :another_posts, except: [:show ] do
    get :search, on: :collection
    resource :favorites, only: [:create, :destroy]
    collection do
      get :favorites
    end
  end
  resources :notification_settings, only: [:index] do
    collection do
      delete 'destroy_all'
    end
  end
end
