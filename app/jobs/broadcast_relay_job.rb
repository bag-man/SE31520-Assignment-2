class BroadcastRelayJob < ActiveJob::Base
  def perform(broadcast)
    ActionCable.server.broadcast "BroadcastChannel",
      broadcast: 123
  end
end
