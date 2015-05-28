class CreateTableJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
      t.float :start_latitude
      t.float :start_longitude
      t.float :stop_latitude
      t.float :stop_longitude
      t.integer :taxi_id
    end
  end
end
