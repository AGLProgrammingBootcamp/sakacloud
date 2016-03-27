class AddFruityToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :fruity,:string
    add_column :reviews, :taste,:string
  end
end
