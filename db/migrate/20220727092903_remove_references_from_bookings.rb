class RemoveReferencesFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :flight_id
    remove_column :bookings, :passenger_id
  end
end
