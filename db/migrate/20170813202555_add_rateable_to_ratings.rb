class AddRateableToRatings < ActiveRecord::Migration[5.0]
  def change
    add_index :ratings, [:rateable_id, :rateable_type]
  end
end
