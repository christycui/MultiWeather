class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id, :location_id
      t.string :body
      t.timestamps
    end
  end
end
