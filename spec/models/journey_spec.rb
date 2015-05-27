require 'rails_helper'

RSpec.describe Journey, type: :model do
  describe 'create' do
    it 'assigns a customer location to a taxi' do
      latitude = 10
      longitude = 20
      taxi = Taxi.create(latitude: 0, longitude: 0)
      journey = Journey.new(latitude, longitude)
      journey.create
      expect(journey.errors).to eq([])
      expect(taxi.reload).to be_assigned
    end

    it 'should not assign a taxi if no taxi is available' do
      latitude = 10
      longitude = 20
      journey = Journey.new(latitude, longitude)
      journey.create
      expect(journey.errors).to eq(['No Taxi Available'])
    end

    it 'should accept conditions about the taxi when assigning a taxi to a customer' do
      latitude = 10
      longitude = 20
      taxi = Taxi.create(latitude: 0, longitude: 0, color: 'pink')
      journey = Journey.new(latitude, longitude, color: 'pink')
      journey.create
      expect(journey.errors).to eq([])
      expect(taxi.reload).to be_assigned
    end
  end
end