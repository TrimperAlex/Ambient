class WeatherEvent < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :bookings
  has_many :renters, through: :bookings
end
