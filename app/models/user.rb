class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :parent_reservations, class_name: 'Reservation', foreign_key: 'parent_id'
  has_many :babysitters, through: :parent_reservations
  has_many :babysitter_reservations, class_name: 'Reservation', foreign_key: 'babysitter_id'
  has_many :parents, through: :babysitter_reservations
  has_many :user_places
  has_many :availabilities, through: :user_places


  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.find_for_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:photo] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end


end

