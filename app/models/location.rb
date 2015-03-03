class Location < ActiveRecord::Base
  include Sluggable
  belongs_to :user
  has_many :posts
  
  validates_uniqueness_of :city_id
  
  sluggable_column :name
  
  NICKNAME_EX = ["Mom's house", 'Home', 'Work', 'Hometown', 'Vacation place']
end