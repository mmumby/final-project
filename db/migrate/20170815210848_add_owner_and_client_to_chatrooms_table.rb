class AddOwnerAndClientToChatroomsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :owner_id, :integer
    add_column :chatrooms, :client_id, :integer
  end
end
