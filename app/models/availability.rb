class Availability < ApplicationRecord
  belongs_to :user_place
  validates :start, presence: true
  validates :end, presence: true
end
