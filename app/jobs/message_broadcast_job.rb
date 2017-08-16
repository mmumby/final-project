class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "room-#{message.user_id}:messages", message: render_message(message)

    ActionCable.server.broadcast "room-#{message.recipient_id}:messages", message: render_message(message), notification: render_notification(message)
  end

  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    end

    def render_notification(message)
      ApplicationController.renderer.render(partial: 'notifications/notification', locals: { message: message })
    end
end