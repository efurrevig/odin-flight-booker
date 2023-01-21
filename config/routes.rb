Rails.application.routes.draw do
  devise_for :users
  root 'flights#index'
  resources :flights
end
