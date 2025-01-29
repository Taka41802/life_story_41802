Rails.application.routes.draw do
  devise_for :users

  resources :albums do
    resources :photos, only: [:show,:new, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create]
    end
  end

  root to: 'albums#index'
  resources :users, only: [:show]
end
