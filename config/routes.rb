Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :weather_events do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[destroy show edit update]

  get '/my_weather_events', to: 'weather_events#owner_list'
  get '/my_bookings', to: 'bookings#my_bookings'
  get '/owner_bookings/:id', to: 'bookings#requests'
end
