class WeatherEvent < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :bookings, dependent: :destroy
  has_many :renters, through: :bookings, source: :users
  has_one_attached :photo
end
