class FlightGenerator
  def initialize(date)
    @date = date
  end

  def call
    airport_pairs = find_airport_pairs
    airport_pairs.each do |airport_pair|
      create_flights(airport_pair)
    end
  end

  private

  def create_flights(airport_pair)
    origin = Airport.find_by(name: airport_pair[0])
    destination = Airport.find_by(name: airport_pair[1])

    flight_duration = find_flight_duration(airport_pair)

    departure_times = [morning_time, afternoon_time, evening_time]
    departure_times.each do |departure_time|
      Flight.create(departure_airport: origin,
                    arrival_airport: destination,
                    takeoff: departure_time,
                    duration: flight_duration)
    end
  end

  def flight_duration
    {
      Diblin: { London: 60, Glasgow: 70 },
      London: { Dublin: 60, Glasgow: 80 },
      Glasgow: { Diblin: 70, London: 80 }
    }
  end

  def find_airport_pairs
    flight_duration.keys.map(&:to_s).permutation(2)
  end

  def find_flight_duration(airports)
    flight_duration[airports[0].to_sym][airports[1].to_sym]
  end

  def morning_time
    Faker::Time.between_dates(from: Date.today, to: Date.today + 1, period: :morning)
  end

  def afternoon_time
    Faker::Time.between_dates(from: Date.today, to: Date.today + 1, period: :afternoon)
  end

  def evening_time
    Faker::Time.between_dates(from: Date.today, to: Date.today + 1, period: :evening)
  end
end