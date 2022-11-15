class WeatherEventsController < ApplicationController
  before_action :set_weather_event, only: %i[show update destroy]
  def index
    @weather_events = WeatherEvent.all
  end

  def new
    @weather_event = WeatherEvent.new
  end

  def show
  end

  def create
    @weather_event = WeatherEvent.new(weather_event_params)

    if @weather_event.save
      redirect_to weather_event_path(@weather_event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @weather_event.destroy
  end

  private

  def set_weather_event
    @weather_event = WeatherEvent.find(params[:id])
  end

  def weather_event_params
    params.require(:weather_event).permit(:description, :category, :temperature, :image_url, :price, :owner_id)
  end
end
