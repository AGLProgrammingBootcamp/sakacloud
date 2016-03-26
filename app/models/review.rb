class Review < ActiveRecord::Base
  belongs_to :sake
  belongs_to :user
  validates :comment, presence: true
end
