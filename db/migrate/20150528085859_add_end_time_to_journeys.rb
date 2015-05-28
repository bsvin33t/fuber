class AddEndTimeToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :end_time, :datetime
  end
end
