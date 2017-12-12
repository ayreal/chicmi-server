class Designer < ApplicationRecord
  has_many :designer_events
  has_many :events, through: :designer_events
  has_many :user_designers
  has_many :users, through: :user_designers

end
