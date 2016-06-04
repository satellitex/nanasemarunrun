Rails.application.routes.draw do
  root 'application#hello'
  namespace :api, default: {format: :json} do
    resources :chats, only: :create
  end
end

