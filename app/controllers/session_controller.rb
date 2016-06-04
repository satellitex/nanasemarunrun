class SessionController < ApplicationController
  skip_before_filter :verify_authenticity_token #外部からのリクエストを許可する
  protect_from_forgery with: :exception

  def index
    ng = { id: nil }
    if params["accountName"].nil?
      render json: ng
    else
      user = User.find_by_accountname( params["accountName"] )
      if user.nil?
        render json: ng
      else
        if user.password_digest == params["password"]
          render json: { id:user.id }
        else
          render json: ng
        end
      end
    end
  end
  
  def create
  end
end
