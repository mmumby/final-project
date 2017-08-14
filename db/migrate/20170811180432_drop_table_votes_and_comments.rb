class DropTableVotesAndComments < ActiveRecord::Migration[5.0]
  def change
    drop_table :comments
    drop_table :votes
  end
end
