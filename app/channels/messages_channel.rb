class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room-#{current_user.id}:messages"
  end

  def receive(payload)
    @chatroom = Chatroom.find(payload["chatroom_id"])
    @recipient = check_recipient(@chatroom.id)
    Message.create(user: current_user, chatroom_id: payload["chatroom_id"], content: payload["message"], recipient_id: @recipient)
  end

  def check_recipient(chatroom)
    @chatroom = Chatroom.find(chatroom)
    if
      current_user.id != @chatroom.owner_id
      @chatroom.owner_id
    else
      @chatroom.client_id
    end
  end
end