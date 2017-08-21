Rails.application.routes.draw do

  resources :claims, only: [:create]

  root to: 'welcome#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :posts do
    resources :comments
  end

  resources :users, only: [:show] do
    resources :comments
    resources :ratings
  end
  resources :welcome, only: [:index]

  resources :chatrooms do
    collection do
      post :new_chat
    end
  end

  resources :messages

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
