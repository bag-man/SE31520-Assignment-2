class BroadcastChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "broadcast_#{params[:room]}"

    # Maybe this
    # post = Broadcast.find(params[:id])
    # stream_for post
    # With this is the BroadcastController
    # BroadcastChannel.broadcast_to(@broadcast, @comment)
  end
end
