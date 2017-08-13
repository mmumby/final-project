class AddPostIdToClaimsAndAddUserIdToClaims < ActiveRecord::Migration[5.0]
  def change
    add_column :claims, :claimer_id, :string
    add_reference :claims, :user, index: true, foreign_key: true
    add_reference :claims, :post, index: true, foreign_key: true
  end
end
