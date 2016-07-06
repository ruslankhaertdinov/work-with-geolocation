class PagesController < ApplicationController
  include GmapsLinks

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
