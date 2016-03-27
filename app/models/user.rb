class User < ActiveRecord::Base
  validates :name, presence: true
  # validates :email, presence: true, uniqueness: true
  has_many :reviews
  has_many :sakes, :through => :reviews
end
