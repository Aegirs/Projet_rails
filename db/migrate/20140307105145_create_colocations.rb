class CreateColocations < ActiveRecord::Migration
  def change
    create_table :colocations do |t|
      t.string :titre
      t.string :adress
      t.integer :superficie
      t.integer :chambre
      t.integer :nbmaxcoloc
      t.integer :loyer
      t.string :occupants

      t.timestamps
    end
  end
end
