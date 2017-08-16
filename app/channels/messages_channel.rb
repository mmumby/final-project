class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room-#{current_user.id}:messages"
  end

  def receive(payload)
    @chatroom = Chatroom.find(payload["chatroom_id"])
    Message.create(user: current_user, chatroom_id: payload["chatroom_id"], content: payload["message"], recipient_id: check_recipient(@chatroom.id))
  end

  def check_recipient(chatroom)
    @chatroom = Chatroom.find(chatroom)
    if
      current_user != @chatroom.owner_id
      @chatroom.client_id
    else
      @chatroom.owner_id
    end
  end
end