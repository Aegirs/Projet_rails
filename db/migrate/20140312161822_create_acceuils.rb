class CreateAcceuils < ActiveRecord::Migration
  def change
    create_table :acceuils do |t|
      t.string :title

      t.timestamps
    end
  end
end
