class DropSlugFromChatroomsTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :chatrooms, :slug, :string
  end
end
