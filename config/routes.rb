Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trails, only: [:index, :show]
  resources :accommodations, only: [:show] do
    resources :reservations, only: :create
  end
  resources :reservations, only: [:new, :create, :index, :destroy, :update, :patch]
  resources :itineraries, only: :update
end
