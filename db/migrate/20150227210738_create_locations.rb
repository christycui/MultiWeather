class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :user_id, :city_id
      t.string :name, :country, :lat, :lon
    end
  end
end
