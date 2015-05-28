class Journey

  attr_reader :messages

  def initialize(latitude, longitude, conditions={})
    @messages = []
    @customer_latitude = latitude
    @customer_longitude = longitude
    @conditions = conditions.delete_if { |key, value| value.blank? }
  end

  def create
    taxi = EmptyTaxi.nearest_to(@customer_latitude, @customer_longitude, @conditions)
    if taxi
      taxi.assign_to(@customer_latitude, @customer_longitude)
      @messages << 'Taxi Assigned Successfully'
    else
      @messages << 'No Taxi Available'
    end
  end
end