class Journey::JourneyStateFactory
  def self.create(journey)
    if journey.unstarted?
      Journey::UnstartedJourneyState.new(journey)
    elsif journey.started?
      Journey::StartedJourneyState.new(journey)
    elsif journey.ended?
      Journey::EndedJourneyState.new(journey)
    end
  end
end