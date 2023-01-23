Rails.application.routes.draw do
  devise_for :users
  root 'flights#index'
  resources :flights
  resources :bookings
  resources :users
  resources :airports
  resources :passengers
end
