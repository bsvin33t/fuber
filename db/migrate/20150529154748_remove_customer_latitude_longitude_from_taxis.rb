class RemoveCustomerLatitudeLongitudeFromTaxis < ActiveRecord::Migration
  def change
    remove_column :taxis, :customer_latitude
    remove_column :taxis, :customer_longitude
  end
end
