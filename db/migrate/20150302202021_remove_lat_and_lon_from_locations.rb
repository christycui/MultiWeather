class RemoveLatAndLonFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :lat
    remove_column :locations, :lon
  end
end
