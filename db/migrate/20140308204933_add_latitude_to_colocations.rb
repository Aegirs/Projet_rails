class AddLatitudeToColocations < ActiveRecord::Migration
  def change
    add_column :colocations, :latitude, :float
  end
end
