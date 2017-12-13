class Api::V1::EventsController < ApplicationController
  def index
    @events = Event.all
    render json: @events
  end

  def show
    event = Event.find_by(id: params[:id])
    # @comments = event.comments
    render json: event.to_json
  end
end
