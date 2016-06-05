Rails.application.routes.draw do
  root  'users#index'

  resources :application
  
  get 'api/index' => 'session#index'
  get 'api/signup' => 'users#create'
  get 'api/makeroom'  => 'rooms#make'
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

