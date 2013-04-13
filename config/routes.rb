require 'sidekiq/web'

Read2::Application.routes.draw do

  get "users/create"

  get "users/update"

  get "users/destroy"

  get "users/activate"

  mount Sidekiq::Web => '/sidekiq'

  resources :feeds, only: [:show, :index]
  
  root to: 'welcome#index'

end