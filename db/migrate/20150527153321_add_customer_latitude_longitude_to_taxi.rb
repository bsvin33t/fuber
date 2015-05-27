class AddCustomerLatitudeLongitudeToTaxi < ActiveRecord::Migration
  def change
    add_column :taxis, :customer_latitude, :float
    add_column :taxis, :customer_longitude, :float
  end
end
