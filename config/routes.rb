Rails.application.routes.draw do
  root  'users#index'


  namespace :api, default: {format: :json} do
    resources :chats, only: :create
    resources :users
    resources :rooms
    resources :photos
    resources :passports
    resources :addresses
    post 'login'  =>  'session#index'
  end
  
  resources :users
  resources :rooms
  resources :photos
  resources :passports
  resources :addresses
  post 'login'  =>  'session#index'

end

