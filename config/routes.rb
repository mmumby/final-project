Rails.application.routes.draw do

  get 'comments/index'

  get 'comments/new'

  resources :categories
  root to: 'welcome#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :posts do
    resources :comments
  end
  resources :users, only: [:show] do
    resources :comments
  end
  resources :welcome, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
