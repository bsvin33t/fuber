require 'rails_helper'

RSpec.describe Journey::BaseJourneyState, type: :model do

  let(:journey) {
    create(:unstarted_journey)
  }

  describe 'start' do
    it 'raises an error for unimplimented method' do
      expect { Journey::BaseJourneyState.new(journey).start }.
          to raise_error(Exceptions::UnimplementedMethodException, 'Unimplemented method')
    end
  end

  describe 'end' do
    it 'raises an error for unimplimented method' do
      expect { Journey::BaseJourneyState.new(journey).end }.
          to raise_error(Exceptions::UnimplementedMethodException, 'Unimplemented method')
    end
  end

  describe 'paymet_amount' do
    it 'raises an error for unimplimented method' do
      expect { Journey::BaseJourneyState.new(journey).payment_amount }.
          to raise_error(Exceptions::UnimplementedMethodException, 'Unimplemented method')
    end
  end
end