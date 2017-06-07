Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :users, only: [:edit, :update]
  get '/groups' => 'groups#new'
  resources :groups, only: [:new, :create, :edit, :update]
end
