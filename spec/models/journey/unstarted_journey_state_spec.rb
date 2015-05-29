require 'rails_helper'

RSpec.describe Journey::UnstartedJourneyState, type: :model do

  let!(:journey) {
    journey = create(:unstarted_journey)
    journey = Journey.find(journey.id)
  }

  describe 'start' do
    it 'should return a message that ended journey cannot be started' do
      expect(journey.start).to eq('Journey Started Successfully')
    end
  end

  describe 'end' do
    it 'should return a message that an ended journey cannot be ended' do
      expect(journey.end(latitude: 10, longitude: 10)).to eq('Cannot End an Unstarted Journey')
    end
  end

  describe 'payment amount' do
    it 'should return the amount that has to be paid for the trip' do
      expect(journey.payment_amount).to eq('Cannot calculate Payment Amount for a journey that has not Ended')
    end
  end

end