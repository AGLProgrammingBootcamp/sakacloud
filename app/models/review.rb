class Review < ActiveRecord::Base
  belongs_to :sake
  belongs_to :user
end
