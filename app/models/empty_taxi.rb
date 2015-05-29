class EmptyTaxi < Taxi

  def self.nearest_to(latitude, longitude, condition={})
    EmptyTaxi.all.where(condition)
        .inject do |nearest_taxi, taxi|
      nearest_taxi.distance_to(latitude, longitude) < taxi.distance_to(latitude, longitude) ? nearest_taxi : taxi
    end
  end

  default_scope { where(assigned: false) }

  def assign
    update_attributes(assigned: true)
  end
end