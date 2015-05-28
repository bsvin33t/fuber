require 'rails_helper'

RSpec.describe JourneyController, type: :controller do

  describe 'POST create' do
    it 'assigns a taxi to a customer in the given location' do
      taxi = Taxi.create!(latitude: 0, longitude: 0)
      args = {
          journey: {
              latitude: 10,
              longitude: 10
          }}
      expect {
        post :create, args
      }.to change { Journey.count }.by(1)
      expect(taxi.reload).to be_assigned
      expect(response.body).to include('Taxi Assigned Successfully')
      expect(response.body).to include('journey_id')
    end

    it 'assigns an hipster taxi when requested' do
      taxi = Taxi.create!(latitude: 0, longitude: 0, color: 'pink')
      args = {
          journey: {
              latitude: 10,
              longitude: 10,
              color: 'pink'
          }}
      expect {
        post :create, args
      }.to change { Journey.count }.by(1)
      expect(taxi.reload).to be_assigned
      expect(response.body).to include('Taxi Assigned Successfully')
      expect(response.body).to include('journey_id')
    end

    it 'responds with a failure message if there are no taxis available' do
      args = {
          journey: {
              latitude: 10,
              longitude: 10
          }}
      expect {
        post :create, args
      }.to change { Journey.count }.by(0)
      expect(response.body).to include('No Taxi Available')
    end
  end

  describe 'PUT start' do
    it 'starts the journey from the customer location' do
      Taxi.create!(latitude: 0, longitude: 0, color: 'pink')
      journey = Journey.create!(start_latitude: 10, start_longitude: 10)
      put :start, id: journey.id
      expect(journey.reload.start_time).not_to be_nil
      expect(response.body).to include('Journey Started Successfully')
    end
  end

  describe 'PUT end' do
    it 'ends the journey at the given location' do
      Taxi.create!(latitude: 0, longitude: 0, color: 'pink')
      journey = Journey.create!(start_latitude: 10, start_longitude: 10)
      journey.start
      args = {
          id: journey.id,
          journey: {
              latitude: 10,
              longitude: 20
          }}
      put :end, args
      expect(journey.reload.end_time).not_to be_nil
      expect(response.body).to include('Journey Ended Successfully')
    end
  end

  describe 'GET payment amount' do
    it 'gets the amount that has to be paid by the customer for the journey' do
      Taxi.create!(latitude: 0, longitude: 0)
      journey = Journey.create!(start_latitude: 10, start_longitude: 10)
      journey.start
      journey.end(end_latitude: 10, end_longitude: 20)
      get :payment_amount, id: journey.id
      expect(response.body).to include('21')
    end
  end
end
