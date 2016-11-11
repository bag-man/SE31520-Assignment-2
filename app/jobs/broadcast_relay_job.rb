class BroadcastRelayJob < ActiveJob::Base
  def perform(broadcast)
    puts('1111111111111111')
    ActionCable.server.broadcast "broadcast",
      broadcast: broadcast
  end
end
