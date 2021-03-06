Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :planes do
    resources :bookings, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :reviews, only: :create
  end
  get '/bookings', to: 'bookings#index', as: :bookings
  patch 'bookings/:id/decline', to: 'bookings#decline_booking', as: :decline
  patch 'bookings/:id/confirm', to: 'bookings#confirm_booking', as: :confirm
  get 'user/:id/my_planes', to: 'users#my_planes', as: :myplanes
end
