class AddEndLatitudeLongitudeToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :end_latitude, :float
    add_column :journeys, :end_longitude, :float
  end
end
