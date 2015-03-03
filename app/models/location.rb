class Location < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  
  
  NICKNAME_EX = ["Mom's house", 'Home', 'Work', 'Hometown', 'Vacation place']

end