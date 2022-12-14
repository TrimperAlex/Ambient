class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :weather_events, foreign_key: :owner_id
  has_many :bookings
  has_many :owner_bookings, through: :weather_events, source: :bookings
end
