require 'sidekiq/web'

Read2::Application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'

  resources :feeds, only: [:show, :index]

  # Users
  resources :users do
    member do
      get :activate
    end
  end

  match 'login' => 'user_sessions#new', as: :login
  match 'logout' => 'user_sessions#destroy', as: :logout

  resources :user_sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:create, :edit, :update]

  resource :oauth do
    get :callback
  end
  
  root to: 'welcome#index'

end