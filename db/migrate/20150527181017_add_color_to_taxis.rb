class AddColorToTaxis < ActiveRecord::Migration
  def change
    add_column :taxis, :color, :string
  end
end
