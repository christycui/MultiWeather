class Location < ActiveRecord::Base
  belongs_to :user
  
  
  NICKNAME_EX = ["Mom's house", 'Home', 'Work', 'Hometown', 'Vacation place']

end