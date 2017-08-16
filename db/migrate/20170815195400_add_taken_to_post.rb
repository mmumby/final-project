class AddTakenToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :taken, :boolean, default: false
  end
end
