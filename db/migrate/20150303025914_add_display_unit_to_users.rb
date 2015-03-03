class AddDisplayUnitToUsers < ActiveRecord::Migration
  def change
    add_column :users, :display_unit, :string
  end
end
