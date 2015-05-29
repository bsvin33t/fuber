class TaxiController < ApplicationController
  def index
    @taxis = Taxi.all
  end
end
