class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy edit update edit_request update_status]
  # def index
  #   @bookings = Booking.where(renter_id: current_user.id)
  # end

  def show
  end

  def new
    @weather_event = WeatherEvent.find(params[:weather_event_id])
    @booking = Booking.new
  end

  def create
    @weather_event = WeatherEvent.find(params[:weather_event_id])
    @booking = Booking.new(booking_params)
    @booking.weather_event = @weather_event
    @booking.renter = current_user
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @booking.weather_event.owner == current_user
      @booking.status = params[:booking][:status]
    else
      @booking.status = 0
    end

    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
  end

  def my_bookings
    @bookings = Booking.where(renter_id: current_user.id)

    @markers = @bookings.geocoded.map do |booking|
      {
        lat: booking.latitude,
        lng: booking.longitude,
        info_window: render_to_string(partial: "info_window", locals: {booking: booking})
      }
    end
  end

  def requests
    @bookings = User.find(current_user.id).owner_bookings
  end

  def edit_request
  end

  def update_status

    if @booking.update(booking_params)
      redirect_to owner_bookings_path(@booking)
    else
      render :edit_request, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    @renter = @booking.renter
  end

  def booking_params
    params.require(:booking).permit(:date, :location, :renter, :weather_event)
  end
end
