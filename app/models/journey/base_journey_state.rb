class Journey::BaseJourneyState

  def initialize(journey)
    @journey = journey
  end

  def start
    raise Exceptions::UnimplementedMethodException, 'Unimplemented method'
  end

  def end
    raise Exceptions::UnimplementedMethodException, 'Unimplemented method'
  end

  def payment_amount
    raise Exceptions::UnimplementedMethodException, 'Unimplemented method'
  end

end