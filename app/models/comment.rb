class Comment < ApplicationRecord
  belongs_to: event
  has_one: user, through: :user_events
end
