class FlightsController < ApplicationController
  def index
    @origin_options = Airport.all.map { |a| [a.name, a.id] }
    @destination_options = Airport.all.map { |a| [a.name, a.id] }

    # @available_flights = 
  end

  private

  def flight_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :takeoff, :number_of_passengers)
  end
end
