Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: "callbacks" }
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  devise_scope :user do
    get 'singup', to: 'devise/registrations#new'
  end
  resources :comments
  resources :friend_relationships
  resources :friend_requests
  resources :likes
  resources :posts
  resources :users
  root "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
