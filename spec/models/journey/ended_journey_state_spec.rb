require 'rails_helper'

RSpec.describe Journey::EndedJourneyState, type: :model do

  let!(:journey) {
    journey = create(:ended_journey)
    journey = Journey.find(journey.id)
  }

  describe 'start' do
    it 'should return a message that ended journey cannot be started' do
      expect(journey.start).to eq('Cannot Start an Ended Journey')
    end
  end

  describe 'end' do
    it 'should return a message that an ended journey cannot be ended' do
      expect(journey.end(latitude: 10, longitude: 10)).to eq('Cannot End an Ended Journey')
    end
  end

  describe 'payment amount' do
    it 'should return the amount that has to be paid for the trip' do
      expect(journey.payment_amount).to eq(21)
    end
  end

end