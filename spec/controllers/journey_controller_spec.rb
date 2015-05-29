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
      journey = create(:unstarted_journey)
      put :start, id: journey.id
      expect(journey.reload.start_time).not_to be_nil
      expect(response.body).to include('Journey Started Successfully')
    end

    it 'returns an error message when start is called on a a started journey' do
      journey = create(:started_journey)
      put :start, id: journey.id
      expect(response.body).to include('Cannot Start a Started Journe')
    end

    it 'returns an error message when start is called on a a ended journey' do
      journey = create(:ended_journey)
      put :start, id: journey.id
      expect(response.body).to include('Cannot Start an Ended Journey')
    end

  end

  describe 'PUT end' do
    it 'ends the journey at the given location and unassigns the taxi' do
      taxi = create(:taxi)
      journey = create(:started_journey, taxi: taxi)
      args = {
          id: journey.id,
          journey: {
              latitude: 10,
              longitude: 20
          }}
      put :end, args
      expect(response.body).to include('Journey Ended Successfully')
      expect(taxi).not_to be_assigned
    end

    it 'gives an error message for an unstarted journey' do
      journey = create(:unstarted_journey)
      args = {
          id: journey.id,
          journey: {
              latitude: 10,
              longitude: 20
          }}
      put :end, args
      expect(response.body).to include('Cannot End an Unstarted Journey')
    end

    it 'gives an error message for an ended journey' do
      journey = create(:ended_journey)
      args = {
          id: journey.id,
          journey: {
              latitude: 10,
              longitude: 20
          }}
      put :end, args
      expect(response.body).to include('Cannot End an Ended Journey')
    end

    it 'gives an error message for invalid arguments' do
      journey = create(:started_journey)
      args = {
          id: journey.id,
          journey: {
              latitude: 10
          }}
      put :end, args
      expect(response.body).to include("Unable to end journey because: End longitude can't be blank")
    end
  end

  describe 'GET payment amount' do
    it 'gets the amount that has to be paid by the customer for the journey' do
      journey = create(:ended_journey)
      get :payment_amount, id: journey.id
      expect(response.body).to include('21')
    end

    it 'gives an error message for a journey that is unstarted' do
      journey = create(:unstarted_journey)
      get :payment_amount, id: journey.id
      expect(response.body).to include('Cannot calculate Payment Amount for a journey that has not Ended')
    end

    it 'gives an error message for a journey that is started' do
      journey = create(:started_journey)
      get :payment_amount, id: journey.id
      expect(response.body).to include('Cannot calculate Payment Amount for a journey that has not Ended')
    end
  end
end
