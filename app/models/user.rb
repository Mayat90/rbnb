class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :parent_reservations, class_name: 'Reservation', foreign_key: 'parent_id'
  has_many :babysitters, through: :parent_reservations
  has_many :babysitter_reservations, class_name: 'Reservation', foreign_key: 'babysitter_id'
  has_many :parents, through: :babysitter_reservations
  has_many :user_places
  has_many :availabilities, through: :user_places


  validates :first_name, presence: true
  validates :last_name, presence: true
end

