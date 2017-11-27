class UserPlace < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :address, presence: true
end
