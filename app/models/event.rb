class Event < ApplicationRecord
  has_many :designers, through: :designer_events
  has_many :users, through: :user_designers
  has_many :comments
end
