class AddDescriptionToColocations < ActiveRecord::Migration
  def change
    add_column :colocations, :description, :string
  end
end
