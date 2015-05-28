class JourneyController < ApplicationController
  def create
    journey = Journey.new(start_latitude: journey_params[:latitude],
                          start_longitude: journey_params[:longitude],
                          conditions: {color: journey_params[:color]})
    if journey.save
      render json: {journey_id: journey.id, message: 'Taxi Assigned Successfully'}
    else
      render json: 'No Taxi Available'
    end

  end

  def start
    if Journey.find(params[:id]).start
      render json: {message: 'Journey Started Successfully'}
    end
  end

  def end
    if Journey.find(params[:id]).end(end_latitude: journey_params[:latitude], end_longitude: journey_params[:longitude])
      render json: {message: 'Journey Ended Successfully'}
    end
  end

  def payment_amount
    render json: {payment_amount: Journey.find(params[:id]).payment_amount}
  end

  private

  def journey_params
    params.require(:journey).permit(:latitude, :longitude, :color)
  end
end
