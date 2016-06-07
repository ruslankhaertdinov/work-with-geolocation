class LocationsController < ApplicationController
  # expose(:users) { User.all }
  # expose(:users_hash) do
  #   Gmaps4rails.build_markers(users) do |user, marker|
  #     marker.lat user.latitude
  #     marker.lng user.longitude
  #   end
  # end

  def index
  end

  def fetch
    render json: { coords: request_location.to_h }
  end

  private

  def request_location
    session[:request_location] ||= request_location_data
    RequestLocation.new(session[:request_location])
  end

  def request_location_data
    request.location && request.location.data
  end
end
