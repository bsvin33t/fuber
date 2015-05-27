class Taxi < ActiveRecord::Base
  include Location

  def distance_to(latitude, longitude)
    distance_between(self.latitude, self.longitude, latitude, longitude)
  end

  def assigned?
    !(customer_latitude.nil? && customer_longitude.nil?)
  end
end
