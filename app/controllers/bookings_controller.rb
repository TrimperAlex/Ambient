class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy edit update]
  def index
    @bookings = Booking.all
  end

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
    @booking = Booking.update(booking_params)

    if @booking.save
      redirect_to weather_event_bookings_path(@booking)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :location, :renter, :weather_event)
  end
end
