require 'rails_helper'

RSpec.describe Journey, type: :model do
  describe 'create' do
    it 'assigns a customer location to a taxi' do
      latitude = 10
      longitude = 20
      taxi = Taxi.create(latitude: 0, longitude: 0)
      journey = Journey.new(start_latitude: latitude, start_longitude: longitude)
      journey.save
      expect(journey.errors.full_messages).to eq([])
      expect(taxi.reload).to be_assigned
    end

    it 'should not assign a taxi if no taxi is available' do
      latitude = 10
      longitude = 20
      journey = Journey.new(start_latitude: latitude, start_longitude: longitude)
      journey.save
      expect(journey.errors.full_messages).to eq(["Taxi can't be blank"])
    end

    it 'should accept conditions about the taxi when assigning a taxi to a customer' do
      latitude = 10
      longitude = 20
      taxi = Taxi.create(latitude: 0, longitude: 0, color: 'pink')
      journey = Journey.new(start_latitude: latitude, start_longitude: longitude, conditions: {color: 'pink'})
      journey.save
      expect(journey.errors.full_messages).to eq([])
      expect(taxi.reload).to be_assigned
    end

    it 'should not assign a taxi if no taxi with the given condition is available' do
      latitude = 10
      longitude = 20
      Taxi.create(latitude: 10, longitude: 10)
      journey = Journey.new(start_latitude: latitude, start_longitude: longitude, conditions: {color: 'pink'})
      journey.save
      expect(journey.errors.full_messages).to eq(["Taxi can't be blank"])
    end

    it 'should assign a taxi with conditions if that is the closest to the customer' do
      latitude = 10
      longitude = 20
      taxi_1 = Taxi.create(latitude: 10, longitude: 10, color: 'pink')
      taxi_2 = Taxi.create(latitude: 10, longitude: 20)
      journey = Journey.new(start_latitude: latitude, start_longitude: longitude, conditions: {color: 'pink'})
      journey.save
      expect(journey.errors.full_messages).to eq([])
      expect(taxi_1.reload).to be_assigned
      expect(taxi_2.reload).not_to be_assigned
    end
  end

  describe 'start' do
    it 'adds the start time of the trip' do
      Taxi.create(latitude: 0, longitude: 0)
      journey = Journey.create!(start_latitude: 10, start_longitude: 10)
      journey.start
      expect(journey.start_time).not_to be_nil
    end
  end

  describe 'end' do
    it 'adds the end time and end location of the trip' do
      journey = create(:started_journey)
      journey = Journey.find(journey.id)
      journey.end(end_latitude: 10, end_longitude: 20)
      expect(journey.end_latitude).to eq(10)
      expect(journey.end_longitude).to eq(20)
      expect(journey.end_time).not_to be_nil
    end
  end

  describe 'payment amount' do
    it 'returns the amount that has to be paid by the customer for the ride' do
      t = Time.now
      journey = create(:ended_journey, start_time: t, end_time: t + 30.minutes)
      journey = Journey.find(journey.id)
      expect(journey.payment_amount).to eq(50)
    end

    it 'returns the amount with the extras when a hipster taxi is used' do
      t = Time.now
      taxi = Taxi.create!(latitude: 0, longitude: 0, color: 'pink')
      journey = create(:ended_journey,taxi: taxi, start_time: t, end_time: t + 30.minutes)
      journey = Journey.find(journey.id)
      expect(journey.reload.payment_amount).to eq(55)
    end
  end
end