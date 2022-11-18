class WeatherEventsController < ApplicationController
  before_action :set_weather_event, only: %i[show destroy edit update]
  def index
    @weather_events = WeatherEvent.all
  end

  def owner_list
    @my_weather_events = WeatherEvent.where(owner_id: current_user.id)
  end

  def new
    @weather_event = WeatherEvent.new
  end

  def show
  end

  def create
    @weather_event = WeatherEvent.new(weather_event_params)
    @weather_event.owner = current_user

    if @weather_event.save
      redirect_to weather_event_path(@weather_event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    # @weather_event = WeatherEvent.update(weather_event_params)

    if @weather_event.update(weather_event_params)
      redirect_to weather_event_path(@weather_event), notice: "your weather event has been updated!"
    else
      render :edit, status: :unprocessable_entity
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
    params.require(:weather_event).permit(:description, :category, :temperature, :image_url, :price, :photo)
  end
end
