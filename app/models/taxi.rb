class Taxi < ActiveRecord::Base
  include Location

  def distance_to(latitude, longitude)
    distance_between(self.latitude, self.longitude, latitude, longitude)
  end

  def assign_to(latitude, longitude)
    update_attributes(customer_latitude: latitude, customer_longitude: longitude)
  end

  def assigned?
    !(customer_latitude.nil? && customer_longitude.nil?)
  end
end
