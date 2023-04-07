class Api::MessagesController < ApplicationController
  def random
    @message = Message.order('RANDOM()').first
    render json: @message
  end
end
