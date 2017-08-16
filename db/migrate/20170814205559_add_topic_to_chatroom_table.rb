class AddTopicToChatroomTable < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :topic, :string
  end
end
