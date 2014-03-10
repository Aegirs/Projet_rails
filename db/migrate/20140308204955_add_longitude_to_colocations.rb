class AddLongitudeToColocations < ActiveRecord::Migration
  def change
    add_column :colocations, :longitude, :float
  end
end
