class CreatePassengersAndBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.timestamps
    end

    create_table :bookings do |t|
      t.references :passenger, null: false, foreign_key: true
      t.references :flight, null: false, foreign_key: true
      t.timestamps
    end
  end
end
