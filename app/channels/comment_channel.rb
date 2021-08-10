class CommentChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    puts "testttt/////////////////////////////"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
