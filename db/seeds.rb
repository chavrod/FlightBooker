# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Flight.destroy_all

Flight.reset_pk_sequence

Airport.find_or_create_by(name: 'Dublin')
Airport.find_or_create_by(name: 'London')
Airport.find_or_create_by(name: 'Glasgow')

start = Time.zone.today
finish = Time.zone.today + 10.days

(start..finish).each do |date|
  flight_generator = FlightGenerator.new(date)
  flight_generator.call
end

puts "Created #{Flight.count} flights"
