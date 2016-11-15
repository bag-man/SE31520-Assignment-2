class BroadcastRelayJob < ActiveJob::Base
  def perform(broadcast)
    ActionCable.server.broadcast "BroadcastChannel",
      broadcast: broadcast
  end
end
