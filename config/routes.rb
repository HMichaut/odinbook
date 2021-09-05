Rails.application.routes.draw do
  devise_for :users
  resources :comments
  resources :friend_relationships
  resources :friend_requests
  resources :likes
  resources :posts
  resources :users
  root "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
