class Comment < ApplicationRecord
  belongs_to :user_event

  def user_event
    #write this method
    byebug
    UserEvent.where({ user_id: params[:user_id], event_id: params[:event_id] })
  end

  def user
    #write this method
    byebug
  end
end
