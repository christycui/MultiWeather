class User < ActiveRecord::Base
  include Sluggable
  has_many :locations
  has_many :posts
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 6}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  
  sluggable_column :username
end