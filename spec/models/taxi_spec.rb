require 'rails_helper'

RSpec.describe Taxi, type: :model do

  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }

  describe 'distance to' do
    it 'gives the distance from itself to a given point' do
      taxi = Taxi.new(latitude: 0, longitude: 0)
      expect(taxi.distance_to(3, 4)).to eq(5)
    end
  end

  describe 'assigned' do
    it 'should return true if a customer is assigned to it' do
      taxi = EmptyTaxi.new(latitude: 0, longitude: 0)
      taxi.assign
      expect(taxi).to be_assigned
    end

    it 'should return false if a customer is not assigned to it' do
      taxi = Taxi.new(latitude: 0, longitude: 0)
      expect(taxi).not_to be_assigned
    end
  end

  describe 'unassign' do
    it 'should change the assigned status of a taxi' do
      taxi = create(:taxi)
      taxi.unassign
      expect(taxi).not_to be_assigned
    end
  end

  describe 'hipster' do
    it 'should be a hipster car if the color is pink' do
      taxi = Taxi.new(latitude: 0, longitude: 0, color: 'pink')
      expect(taxi).to be_hipster
    end

    it 'should not be a hipster if the color is not pink' do
      taxi = Taxi.new(latitude: 0, longitude: 0, color: nil)
      expect(taxi).not_to be_hipster
    end
  end
end