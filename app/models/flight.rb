class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  has_many :tickets, dependent: :destroy
  has_many :bookings, through: :tickets
  has_many :passengers, through: :tickets

  def quick_flight_info
    "Departing at #{takeoff} from #{departure_airport.name} to #{arrival_airport.name}"
  end
end
