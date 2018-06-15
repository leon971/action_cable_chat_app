# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    stream_from "room_channel_user_#{message_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def user_is_typing(username)
    ActionCable.server.broadcast "room_channel",
                                     typing_user: "#{message_user.username} is typing ..."
  end

  def user_is_deleting
    ActionCable.server.broadcast "room_channel",
                                     typing_user: 'deleting'
  end

end
