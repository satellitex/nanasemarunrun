class Api::SessionController < ApplicationController
  skip_before_filter :verify_authenticity_token #外部からのリクエストを許可する

  def index
    ok = { ps: "ok" }
    render json: ok
  end
  
  def create
  end
end
