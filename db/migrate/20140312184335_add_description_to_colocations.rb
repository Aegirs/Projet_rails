class AddDescriptionToColocations < ActiveRecord::Migration
  def change
    add_column :colocations, :description, :text
  end
end
