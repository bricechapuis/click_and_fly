Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :planes do
    resources :bookings, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  get '/bookings', to: 'bookings#index', as: :bookings
end
