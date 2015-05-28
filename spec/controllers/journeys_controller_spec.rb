require 'rails_helper'

RSpec.describe JourneysController, type: :controller do

  describe 'POST create' do
    it 'assigns a taxi to a customer in the given location' do
      taxi = Taxi.create!(latitude: 0, longitude: 0)
      args = {
          journey: {
              latitude: 10,
              longitude: 10
          }}
      post :create, args
      expect(taxi.reload).to be_assigned
      expect(response.body).to include('Taxi Assigned Successfully')
    end

    it 'assigns an hipster taxi when requested' do
      taxi = Taxi.create!(latitude: 0, longitude: 0, color: 'pink')
      args = {
          journey: {
              latitude: 10,
              longitude: 10,
              color: 'pink'
          }}
      post :create, args
      expect(taxi.reload).to be_assigned
      expect(response.body).to include('Taxi Assigned Successfully')
    end

    it 'responds with a failure message if there are no taxis available' do
      args = {
          journey: {
              latitude: 10,
              longitude: 10
          }}
      post :create, args
      expect(response.body).to include('No Taxi Available')
    end
  end
end
