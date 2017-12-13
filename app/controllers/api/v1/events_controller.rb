class Api::V1::EventsController < ApplicationController
  def index
    events = Event.all
    render json: events.to_json
  end

  def show
    event = Event.find_by(id: params[:id])
    comments = event.comments
byebug
    render json: event.to_json(include: [:comments])
  end
end
