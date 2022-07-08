class FlightsController < ApplicationController
  def index
    @origin_options = Airport.all.map { |a| [a.name, a.id] }
    @destination_options = Airport.all.map { |a| [a.name, a.id] }
  end
end
