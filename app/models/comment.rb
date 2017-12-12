class Comment < ApplicationRecord
  belongs_to :user_event
  # has_one :user, through: :user_events
  # has_one :event, through: :user_events
end
