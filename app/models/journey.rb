class Journey

  attr_reader :errors

  def initialize(latitude, longitude, conditions={})
    @errors = []
    @customer_latitude = latitude
    @customer_longitude = longitude
    @conditions = conditions
  end

  def create
    taxi = EmptyTaxi.nearest_to(@customer_latitude, @customer_longitude, @conditions)
    if taxi
      taxi.assign_to(@customer_latitude, @customer_longitude)
    else
      @errors << 'No Taxi Available'
    end
  end
end