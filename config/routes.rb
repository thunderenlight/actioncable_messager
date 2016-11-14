Rails.application.routes.draw do
  get 'users/index'

  mount ActionCable.server => '/cable'

  devise_for :users

  root 'conversations#index'
  
  resources :users, only: [:index]
  resources :personal_messages, only: [:new,:create]
  resources :conversations, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
