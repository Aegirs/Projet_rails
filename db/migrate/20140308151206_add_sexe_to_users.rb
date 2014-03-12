class AddSexeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sexe, :string
  end
end
