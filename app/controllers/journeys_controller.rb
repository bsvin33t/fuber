class JourneysController < ApplicationController
  def create
    journey = Journey.new(journey_params[:latitude],
                journey_params[:longitude],
                color: journey_params[:color])
    journey.create
    render json: journey.messages
  end

  private

  def journey_params
    params.require(:journey).permit(:latitude, :longitude, :color)
  end
end
