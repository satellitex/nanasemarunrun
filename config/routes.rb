Rails.application.routes.draw do
  root  'session#index'

  resources :application
  
  get 'api/index' => 'session#index'
  resources :session

  namespace :api, default: {format: :json} do
    resources :chats, only: :create
    resources :users
    resources :rooms
    resources :photos
    resources :passports
    resources :addresses
    
    
  end
  
  resources :users
  resources :rooms
  resources :photos
  resources :passports
  resources :addresses

end

