class EmptyTaxi < Taxi

  def self.nearest_to(latitude, longitude, condition={})
    EmptyTaxi.all.where(condition)
        .inject do |nearest_taxi, taxi|
      nearest_taxi.distance_to(latitude, longitude) < taxi.distance_to(latitude, longitude) ? nearest_taxi : taxi
    end
  end

  default_scope { where(customer_latitude: nil, customer_longitude: nil) }

  def assign_to(latitude, longitude)
    update_attributes(customer_latitude: latitude, customer_longitude: longitude)
  end
end