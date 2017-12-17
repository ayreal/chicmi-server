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

  def create
    user = User.find_by(id: params[:user_id])
    event = Event.find_by(external_id: params[:event][:event_id])
    if !event
      event = Event.new(event_params)
      event.external_id = params[:event][:event_id]
      event.save!
    end
    user.events << event
    render json: event.to_json
  end

  private
   def event_params
     params.require(:event).permit(:external_id, :address_business_name, :address_street_1, :address_street_2, :slug, :address_city, :address_zip, :event_name_en, :start_date, :end_date, :summary, :is_hot, :event_hero_url)
   end
end
