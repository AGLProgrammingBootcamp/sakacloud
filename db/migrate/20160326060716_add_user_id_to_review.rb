class AddUserIdToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :user_id, :integer
    add_column :reviews, :sake_id, :integer
    add_column :reviews, :comment, :string
  end
end
