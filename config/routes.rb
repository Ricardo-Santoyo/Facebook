Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', :omniauth_callbacks => 'users/omniauth_callbacks'}
  resources :posts
  resources :users
  resources :friendrequests, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :notifications, only: [:index]

  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
