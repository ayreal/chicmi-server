class Designer < ApplicationRecord
  has_many :events, through: :designer_events
  has_many :users, through: :user_designers
  has_many :comments, through: :events

end
