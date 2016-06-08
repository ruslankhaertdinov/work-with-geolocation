class PagesController < ApplicationController
  expose(:gmaps_url) { "//maps.google.com/maps/api/js?v=3.23&key=#{ENV['GOOGLE_MAP_KEY']}" }

  helper_method :locations

  def home
  end

  private

  def locations
    User.with_position.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info: user.full_name
      }
    end
  end
end
