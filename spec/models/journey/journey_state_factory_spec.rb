require 'rails_helper'

RSpec.describe Journey::JourneyStateFactory, type: :model  do
  describe 'create' do
    it 'returns unstarted journey state object if the journey status is unstarted' do
      journey = create(:unstarted_journey)
      expect(Journey::JourneyStateFactory.create(journey)).to be_a(Journey::UnstartedJourneyState)
    end

    it 'returns started journey state object if the journey status is unstarted' do
      journey = create(:started_journey)
      expect(Journey::JourneyStateFactory.create(journey)).to be_a(Journey::StartedJourneyState)
    end

    it 'returns ended journey state object if the journey status is unstarted' do
      journey = create(:ended_journey)
      expect(Journey::JourneyStateFactory.create(journey)).to be_a(Journey::EndedJourneyState)
    end
  end
end