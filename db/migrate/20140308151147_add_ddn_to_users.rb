class AddDdnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ddn, :date
  end
end
