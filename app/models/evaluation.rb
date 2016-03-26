class Evaluation < ActiveRecord::Base
  belongs_to :user

  validates :sake_id, presence: true
  validates :user_id, presence: true
  validates :comment, presence: true, length: { maximum: 140 }
end