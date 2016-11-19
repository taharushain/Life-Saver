# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RequestDetailChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'request_detail_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
