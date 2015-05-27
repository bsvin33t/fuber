class Journey
  def initialize(latitude, longitude)
    taxi = EmptyTaxi.nearest_to(latitude, longitude)
    taxi.assign_to(latitude, longitude)
  end
end