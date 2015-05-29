class Journey::StartedJourneyState < Journey::BaseJourneyState
  def start
    'Cannot Start a Started Journey'
  end

  def end(destination)
    journey = @journey.update_attributes(end_time: DateTime.current,
                                         end_latitude: destination[:end_latitude],
                                         end_longitude: destination[:end_longitude],
                                         status: 'ended')
    if journey
      @journey.taxi.unassign
      'Journey Ended Successfully'
    else
      "Unable to end journey because: #{@journey.errors.full_messages.join(' ')}"
    end
  end

  def payment_amount
    'Cannot calculate Payment Amount for a journey that has not Ended'
  end

end