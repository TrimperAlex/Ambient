class AddForeignKeysToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :renter, foreign_key: { to_table: :users }
    add_reference :bookings, :weather_event, foreign_key: true
  end
end
