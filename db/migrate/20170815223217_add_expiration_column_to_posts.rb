class AddExpirationColumnToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :expiration, :datetime
  end
end
