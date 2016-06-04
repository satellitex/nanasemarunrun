Rails.application.routes.draw do
  resources :photos
  resources :passports
  resources :addresses
  resources :rooms
  resources :users
  root  'users#new'
  namespace :api, default: {format: :json} do
    resources :chats, only: :create
  end
end

