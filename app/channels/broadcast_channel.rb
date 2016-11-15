class BroadcastChannel < ApplicationCable::Channel
  def subscribed
    stream_from "BroadcastChannel"
  end
end
