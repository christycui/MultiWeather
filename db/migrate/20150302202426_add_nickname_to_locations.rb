class AddNicknameToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :nickname, :string
  end
end
