class RemoveUserIdFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :user_id, :integer
  end
end
