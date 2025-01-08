Rails.application.routes.draw do
  devise_for :users
  resources :albums do
    resources :photos, only: [:new, :create]
  end
  root to: 'albums#index'
  resources :users, only: :show
end
