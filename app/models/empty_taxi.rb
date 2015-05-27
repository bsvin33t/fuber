class EmptyTaxi < Taxi


  def self.nearest_to(latitude, longitude)
    Taxi.all.inject do |nearest_taxi, taxi|
      nearest_taxi.distance_to(latitude, longitude) < taxi.distance_to(latitude, longitude) ? nearest_taxi : taxi
    end
  end
end