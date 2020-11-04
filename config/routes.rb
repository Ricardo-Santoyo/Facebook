Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :posts
  resources :users, only: [:index, :show]
  resources :friendrequests, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :notifications, only: [:index]

  root 'posts#index'
end
