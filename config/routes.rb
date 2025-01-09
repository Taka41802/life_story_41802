Rails.application.routes.draw do
  devise_for :users

  resources :albums do
    resources :photos
  end

  root to: 'albums#index'
  resources :users, only: :show
end
