class Booking < ApplicationRecord
  belongs_to :renter, class_name: "User", foreign_key: :renter_id
  belongs_to :weather_event
end
