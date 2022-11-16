Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :weather_events do
    resources :bookings, only: %i[new create edit update index]
  end

  resources :bookings, only: %i[destroy show]
end
