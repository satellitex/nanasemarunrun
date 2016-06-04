/*class Api::ChatsController < ApplicationController
end
*/

class Api::ChatsController < ApplicationController
  skip_before_filter :verify_authenticity_token #外部からのリクエストを許可する
  def create
    Pusher['general'].trigger('chat_event', {
      message: params[:message]
    })
  end
end
