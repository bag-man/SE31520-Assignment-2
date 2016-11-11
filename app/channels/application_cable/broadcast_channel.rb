class BroadcastChannel < ApplicationCable::Channel
  def subscribed
    stream_from "broadcast"
  end
end
