class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  
  validates :location_id, presence: true
  validates :body, presence: true
end