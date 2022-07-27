class BookingsController < ApplicationController
  def new
    @booking = Booking.new 

    @selected_flight = Flight.find(params[:flight_option])

    passenger_count = params[:number_of_passengers].to_i
    passenger_count.times { @booking.passengers.build }
  end

  def create
    @booking_option = Booking.create
  end
end
