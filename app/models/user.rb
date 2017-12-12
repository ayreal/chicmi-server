class User < ApplicationRecord
  has_secure_password
  has_many :events, through: :user_events
  has_many :comments, through: :events
  has_many :designers, through: :user_designers

end
