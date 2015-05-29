class AddStatusToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :status, :integer, default: 0
  end
end
