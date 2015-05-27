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
      Taxi.create!(latitude: 0, longitude: 0).assign_to(10,10)
      Taxi.create!(latitude: 5, longitude: 4).assign_to(10,20)
      Taxi.create!(latitude: 8, longitude: 9).assign_to(10,30)
      expect(EmptyTaxi.nearest_to(4, 5)).to eq(nil)
    end
  end


end
