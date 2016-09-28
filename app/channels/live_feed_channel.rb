class LiveFeedChannel < ApplicationCable::Channel
  def subscribed
    stream_from "live_feed"
  end
end
