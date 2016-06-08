class PagesController < ApplicationController
  expose(:gmaps_url) { "//maps.google.com/maps/api/js?v=3.23&key=#{ENV['GOOGLE_MAP_KEY']}" }

  def home
  end
end
