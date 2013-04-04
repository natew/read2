require 'sidekiq/web'

Read2::Application.routes.draw do

  mount Sidekiq::Web => '/sidekiq', constraints: AdminConstraint.new

  resources :feeds, only: [:show, :index]
  
  root to: 'welcome#index'

end