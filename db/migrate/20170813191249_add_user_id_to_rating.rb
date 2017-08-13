class AddUserIdToRating < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :rateable_id, :integer
    add_column :ratings, :rateable_type, :string
end
end