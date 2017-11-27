class Reservation < ApplicationRecord
  belongs_to :user_place
  belongs_to :parent, class_name: 'User'
  belongs_to :babysitter, class_name: 'User'
  belongs_to :review
end
