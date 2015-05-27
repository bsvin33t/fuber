require 'rails_helper'

RSpec.describe EmptyTaxi, type: :model do
  describe 'nearest to' do
    it 'gives the taxi nearest to the given location' do
      taxi_1 = Taxi.create!(latitude: 0, longitude: 0)
      taxi_2 = Taxi.create!(latitude: 5, longitude: 4)
      taxi_3 = Taxi.create!(latitude: 8, longitude: 9)
      expect(EmptyTaxi.nearest_to(4, 5)).to eq(taxi_2)
    end
  end


end
