class AddChatRoomIdToClaimsTable < ActiveRecord::Migration[5.0]
  def change
    add_reference :chatrooms, :claim, index: true, foreign_key: true
  end
end
