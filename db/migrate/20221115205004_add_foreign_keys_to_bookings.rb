class AddForeignKeysToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings do |t|
      t.references :renter, null: false, foreign_key: { to_table: :users }
      t.references :weather_events
    end
  end
end
