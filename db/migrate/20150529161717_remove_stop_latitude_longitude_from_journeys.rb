class RemoveStopLatitudeLongitudeFromJourneys < ActiveRecord::Migration
  def change
    remove_column :journeys, :stop_latitude
    remove_column :journeys, :stop_longitude
  end
end
