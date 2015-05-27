class EmptyTaxi < Taxi

  default_scope { where(customer_latitude: nil, customer_longitude: nil) }

  def self.nearest_to(latitude, longitude)
    EmptyTaxi.all.inject do |nearest_taxi, taxi|
      nearest_taxi.distance_to(latitude, longitude) < taxi.distance_to(latitude, longitude) ? nearest_taxi : taxi
    end
  end
end