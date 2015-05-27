require 'rails_helper'

RSpec.describe Taxi, type: :model do
  describe 'distance to' do
    it 'gives the distance from itself to a given point' do
      taxi = Taxi.new(latitude: 0, longitude: 0)
      expect(taxi.distance_to(3, 4)).to eq(5)
    end
  end

  describe 'assign to' do
    it 'should assign a taxi to the location of the customer' do
      taxi = Taxi.new(latitude: 0, longitude: 0)
      taxi.assign_to(10, 10)
      expect(taxi.customer_latitude).to eq(10)
      expect(taxi.customer_longitude).to eq(10)
    end
  end

  describe 'assigned' do
    it 'should return true if a customer is assigned to it' do
      taxi = Taxi.new(latitude: 0, longitude: 0)
      taxi.assign_to(10, 10)
      expect(taxi).to be_assigned
    end

    it 'should return false if a customer is not assigned to it' do
      taxi = Taxi.new(latitude: 0, longitude: 0)
      expect(taxi).not_to be_assigned
    end
  end
end