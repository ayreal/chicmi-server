class Api::V1::CommentsController < ApplicationController

  def create
    # find or create
    comment = Comment.new(comment_params)
    comment.save!
    event = Event.find_by(id: params[:event_id])
    render json: event.package_json

  end

  private
   def comment_params
     params.require(:comment).permit(:user_id, :event_id, :text, :name)
   end

end
