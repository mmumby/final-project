Rails.application.routes.draw do

  resources :categories
  root to: 'welcome#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :posts
  resources :users, only: [:show]
  resources :welcome, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
