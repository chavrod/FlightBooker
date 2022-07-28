class BookingsController < ApplicationController
  def new
    @booking = Booking.new

    @selected_flight = Flight.find(params[:flight_option])

    passenger_count = params[:number_of_passengers].to_i
    passenger_count.times { @booking.passengers.build }
  end

  def create
    @flights = Flight.find(params[:booking][:flight_option])
    @booking = Booking.new(booking_params)

    if @booking.save
      @passengers = @booking.passengers
      create_tickets(@passengers, @flights)
      flash[:notice] = "New booking created"
      redirect_to @booking
    else
      flash.now[:alert] = 'An error occured!'
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

  # will have to refactor code to allow for connecting fligths (use .map twice)
  def create_tickets(passengers, flight)
    passengers.map { |passenger| @booking.tickets.create(passenger: passenger, flight: flight) }
  end
end
