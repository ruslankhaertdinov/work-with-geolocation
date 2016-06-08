class LocationsController < ApplicationController
  def index
    render json: markers
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

  def markers
    User.with_position.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info: "#{user.full_name} from #{user.full_address}"
      }
    end
  end
end
