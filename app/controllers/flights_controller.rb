class FlightsController < ApplicationController
  def index
    @origin_options = Airport.all.map { |a| [a.name, a.id] }
    @destination_options = Airport.all.map { |a| [a.name, a.id] }

    @available_flights = Flight.where("departure_airport_id = :departure_id AND arrival_airport_id = :arrival_id AND departure_date = :date",
                                      {departure_id: params[:departure_id], arrival_id: params[:arrival_id], date: params[:date]}).to_a
  end

end
