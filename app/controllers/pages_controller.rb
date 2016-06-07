class PagesController < ApplicationController
  expose(:users) { User.all }
  expose(:users_hash) do
    Gmaps4rails.build_markers(users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end

  def home
  end
end
