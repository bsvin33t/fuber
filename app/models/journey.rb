class Journey

  attr_reader :errors

  def initialize(latitude, longitude)
    @errors = []
    @customer_latitude = latitude
    @customer_longitude = longitude
  end

  def create
    taxi = EmptyTaxi.nearest_to(@customer_latitude, @customer_longitude)
    if taxi
      taxi.assign_to(@customer_latitude, @customer_longitude)
    else
      @errors << 'No Taxi Available'
    end
  end
end