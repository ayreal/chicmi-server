class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user_event
  has_one :user, through: :user_event
end
