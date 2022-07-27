class EditAssociations < ActiveRecord::Migration[7.0]
  def change
    create_table :layovers do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :flight, null: false, foreign_key: true
    end
    remove_foreign_key :bookings, column: :flight_id
    remove_foreign_key :bookings, column: :passenger_id
    add_reference :passengers, :booking, foreign_key: true
  end
end
