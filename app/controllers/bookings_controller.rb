class BookingsController < ApplicationController
  def new
    @booking = Booking.new

    @selected_flight = Flight.find(params[:flight_option])

    passenger_count = params[:number_of_passengers].to_i
    passenger_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      flash[:notice] = "New booking created"
      redirect_to @booking
    else
      render :new
    end
  end

  def show
    @booking = Booking.find_by(id: params[:id])
    return if @booking

    flash[:alert] = "Sorry, this booking does not exist."
    redirect_to root_url
  end

  private

  def booking_params
    params.require(:booking).permit(passengers_attributes: %i[name email])
  end

  def create_tickets
  end
end
