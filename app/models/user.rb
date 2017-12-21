class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  validates :name, presence: true

  has_many :user_events
  has_many :events, through: :user_events

  has_many :comments

  has_many :user_designers
  has_many :designers, through: :user_designers

end
