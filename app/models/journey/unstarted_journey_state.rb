class Journey::UnstartedJourneyState < Journey::BaseJourneyState
  def start
    journey = @journey.update_attributes(start_time: DateTime.current, status: 'started')
    if journey
      'Journey Started Successfully'
    end
  end

  def end(destination)
    'Cannot End an Unstarted Journey'
  end

  def payment_amount
    'Cannot calculate Payment Amount for a journey that has not Ended'
  end
end