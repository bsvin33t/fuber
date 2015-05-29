class AddAssignedToTaxis < ActiveRecord::Migration
  def change
    add_column :taxis, :assigned, :boolean, default: false
  end
end
