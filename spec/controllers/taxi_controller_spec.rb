require 'rails_helper'

RSpec.describe TaxiController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      10.times {create(:taxi)}
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:taxis)).to eq(Taxi.all)
    end
  end

end
