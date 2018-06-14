class RoomChannel < ApplicationCable::Channel
  def subscribed
    Rails.logger.fatal '==============================='
    Rails.logger.fatal '==============================='
    Rails.logger.fatal '==============================='
    Rails.logger.fatal '==============================='
    Rails.logger.fatal '==============================='
    
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end