class Api::V1::CommentsController < ApplicationController
  def create
    # find or create
    comment = Comment.new(text: params[:text])
    byebug
    # find user_event where foreign keys match params
    user_event = comment.user_event
    user_event.comments << comment
    comment.save!
    render json: comment.to_json
  end

  def update
    comment = Comment.find_by(id: params[:id])
    comment.likes++
    render json: comment.to_json
  end

end
