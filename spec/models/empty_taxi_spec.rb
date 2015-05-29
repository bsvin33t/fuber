require 'rails_helper'

RSpec.describe EmptyTaxi, type: :model do
  describe 'nearest to' do
    it 'gives the empty taxi nearest to the given location' do
      taxi_1 = EmptyTaxi.create!(latitude: 0, longitude: 0)
      taxi_2 = EmptyTaxi.create!(latitude: 5, longitude: 4)
      taxi_3 = EmptyTaxi.create!(latitude: 8, longitude: 9)
      expect(EmptyTaxi.nearest_to(4, 5)).to eq(taxi_2)
    end

    it 'gives nil if there is no empty taxi' do
      EmptyTaxi.create!(latitude: 0, longitude: 0).assign
      EmptyTaxi.create!(latitude: 5, longitude: 4).assign
      EmptyTaxi.create!(latitude: 8, longitude: 9).assign
      expect(EmptyTaxi.nearest_to(4, 5)).to eq(nil)
    end

    it 'gives the empty taxi nearest to the given location with the condition' do
      taxi_1 = EmptyTaxi.create!(latitude: 0, longitude: 0, color: 'pink')
      taxi_2 = EmptyTaxi.create!(latitude: 5, longitude: 4)
      taxi_3 = EmptyTaxi.create!(latitude: 8, longitude: 9, color: 'pink')
      expect(EmptyTaxi.nearest_to(4, 5, {color: 'pink'})).to eq(taxi_3)
    end

    it 'gives nil if there is no empty taxi with the condition' do
      taxi_1 = EmptyTaxi.create!(latitude: 0, longitude: 0)
      taxi_2 = EmptyTaxi.create!(latitude: 5, longitude: 4)
      taxi_3 = EmptyTaxi.create!(latitude: 8, longitude: 9)
      expect(EmptyTaxi.nearest_to(4, 5, {color: 'pink'})).to eq(nil)
    end
  end

  describe 'assign' do
    it 'should assign a taxi' do
      taxi = EmptyTaxi.new(latitude: 0, longitude: 0)
      taxi.assign
      expect(taxi).to be_assigned
    end
  end


end
