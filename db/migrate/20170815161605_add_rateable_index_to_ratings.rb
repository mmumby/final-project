class AddRateableIndexToRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :rateable_id, :integer
    add_column :ratings, :rateable_type, :string
    add_index :ratings, [:rateable_id, :rateable_type]
  end
end
