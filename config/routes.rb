Rails.application.routes.draw do
  namespace :api, default: {format: :json} do
    resources :chats, only: :create
  end
end
