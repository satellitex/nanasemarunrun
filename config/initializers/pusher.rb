# config/initializers/pusher.rb
require 'pusher'

Pusher.app_id = '213320'
Pusher.key = '59dda6648baadd08d382'
Pusher.secret = 'e3d819500d337feac97c'
Pusher.logger = Rails.logger
Pusher.encrypted = true

# app/controllers/hello_world_controller.rb
class HelloWorldController < ApplicationController
  def hello_world
    Pusher.trigger('test_channel', 'my_event', {
      message: 'hello world'
    })
  end
end
