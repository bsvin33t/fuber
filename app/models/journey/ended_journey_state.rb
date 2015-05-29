class Journey::EndedJourneyState < Journey::BaseJourneyState
  def start
    'Cannot Start an Ended Journey'
  end

  def end(destination)
    'Cannot End an Ended Journey'
  end

  def payment_amount
    (travelled_time * Prices::PERMIN + travelled_distance * Prices::PERKM + extras.to_f).ceil
  end


  private

  def travelled_time
    (@journey.end_time - @journey.start_time)/60
  end

  def travelled_distance
    @journey.distance_between(@journey.start_latitude, @journey.start_longitude,
                              @journey.end_latitude, @journey.end_longitude)
  end

  def extras
    Prices::HIPSTERCAR if @journey.taxi.hipster?
  end
end