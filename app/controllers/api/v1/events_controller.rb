class Api::V1::EventsController < ApplicationController
  # def index
  #   # get an event by its slug
  #   byebug
  #   event = Event.find_by(slug: params[:slug])
  #   render json: event.to_json(include: [:comments])
  # end

  def show
    # finding something in the external API and persisting
    event = Event.find_or_create_by(event_params)
    event.external_id = params[:event][:event_id]
    event.save!
    render json: event.package_json
  end

  def create
    # creating a new UserEvent instance
    user = User.find_by(id: params[:user_id])
    event = Event.find_by(id: params[:event][:id])
    user.events << event
    render json:
    {
      id: user.id,
      name: user.name,
      email: user.email,
      photo: user.photo,
      city_id: user.city_id,
      username: user.username,
      twitter: user.twitter,
      instagram: user.instagram,
      bio: user.bio,
      events: user.events
    }
  end

  def destroy
    # deleting a UserEvent instance
    user = User.find_by(id: params[:user_id])
    event = Event.find_by(id: params[:id])
    user.user_events.find_by(event_id: event.id).delete
    render json:
    {
      id: user.id,
      name: user.name,
      email: user.email,
      photo: user.photo,
      city_id: user.city_id,
      username: user.username,
      twitter: user.twitter,
      instagram: user.instagram,
      bio: user.bio,
      events: user.events
    }
  end

  private
   def event_params
     params.require(:event).permit(:external_id, :address_business_name, :address_street_1, :address_street_2, :slug, :address_city, :address_zip, :event_name_en, :start_date, :end_date, :summary, :is_hot, :event_hero_url, :longitude, :latitude, :event_logo_pin)
   end
end
