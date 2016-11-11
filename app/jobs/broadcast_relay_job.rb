class BroadcastRelayJob < ActiveJob::Base
  def perform(broadcast)
    ActionCable.server.broadcast "broadcast",
      broadcast: broadcast
  end
end
