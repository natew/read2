require 'sidekiq/web'

Read2::Application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'

  resources :feeds, only: [:show, :index]
  
  root to: 'welcome#index'

end