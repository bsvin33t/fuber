require 'rails_helper'

RSpec.describe Journey, type: :model do
  describe 'new journey' do
    it 'assigns a customer location to a taxi' do
      latitude = 10
      longitude = 20
      taxi = Taxi.create(latitude: 0, longitude: 0)
      Journey.new(latitude, longitude)
      expect(taxi.reload).to be_assigned
    end
  end
end