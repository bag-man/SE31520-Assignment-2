class BroadcastRelayJob < ActiveJob::Base
  def perform(broadcast)
    ActionCable.server.broadcast "BroadcastChannel", broadcast: render_update(broadcast)
  end

  def render_update(broadcast)
    ApplicationController.renderer.render(partial: 'broadcasts/broadcast', locals: { broadcast: broadcast })
  end
end
