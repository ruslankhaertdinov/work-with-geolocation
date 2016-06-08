class RequestLocation
  attr_reader :location
  private :location

  # NOTE: Lat, Lon for San-Francisco
  LATITUDE = 37.773972
  LONGITUDE = -122.431297

  def initialize(location)
    @location = location || {}
  end

  def to_h
    { "latitude" => latitude, "longitude" => longitude }
  end

  private

  def latitude
    lat = location["latitude"]
    lat.to_i.zero? ? LATITUDE : lat.to_f
  end

  def longitude
    lng = location["longitude"]
    lng.to_i.zero? ? LONGITUDE : lng.to_f
  end
end
