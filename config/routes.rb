Rails.application.routes.draw do
  devise_for :users
  resources :albums
  root to: 'albums#index'
  resources :users, only: :show
end
