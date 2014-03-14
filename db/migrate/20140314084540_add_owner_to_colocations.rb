class AddOwnerToColocations < ActiveRecord::Migration
  def change
    add_column :colocations, :owner, :string
  end
end
