class CreateLocataires < ActiveRecord::Migration
  def change
    create_table :locataires do |t|
      t.string :pseudo
      t.integer :colocation_id

      t.timestamps
    end
  end
end
