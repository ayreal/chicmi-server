class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  has_many :designer_events
  has_many :designers, through: :designer_events

  def comments
    # see all comments on a particular event:
    # get all userevents for a specific event
   byebug
   # Comment.where()
  #   ue = event.user_events
  #   # for each userevent, get all the comments
  #   comments = []
  #   ue.each do |userevent|
  #     userevent.comments.each do |comment|
  #       comments << comment
  #     end
  #   end
  #
  # end

end
