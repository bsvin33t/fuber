require 'rails_helper'

RSpec.describe Journey::StartedJourneyState, type: :model do

  let!(:taxi){ create(:taxi)}

  let!(:journey) {
    journey = create(:started_journey, taxi: taxi)
    journey = Journey.find(journey.id)
  }

  describe 'start' do
    it 'should return a message that ended journey cannot be started' do
      expect(journey.start).to eq('Cannot Start a Started Journey')
    end
  end

  describe 'end' do
    it 'should return a message that the journey has ended' do
      expect(journey.end(end_latitude: 10, end_longitude: 10)).to eq('Journey Ended Successfully')
    end

    it 'should unassign the taxi' do
      expect(taxi).not_to be_assigned
    end

    it 'should add a message that the destination is invalid' do
      expect(journey.end(end_latitude: 10)).to eq("Unable to end journey because: End longitude can't be blank")
    end
  end

  describe 'payment amount' do
    it 'should return the amount that has to be paid for the trip' do
      expect(journey.payment_amount).to eq('Cannot calculate Payment Amount for a journey that has not Ended')
    end
  end

end