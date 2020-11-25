Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trails, only: [:index, :show]
  resources :accomodations, only: [:show]
  resources :reservations, only: [:new, :create, :index, :destroy, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
