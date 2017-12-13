class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  has_many :designer_events
  has_many :designers, through: :designer_events

  def comments
    # see all comments on a particular event:
    # get all userevents for a specific event
    comments = []
    self.user_events.each do |ue|
      ue.comments.each{|c| comments << c}
    end
    comments
    # byebug
  end

end
