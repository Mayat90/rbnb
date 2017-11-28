class UserPlace < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :availabilities

  validates :address, presence: true
end
