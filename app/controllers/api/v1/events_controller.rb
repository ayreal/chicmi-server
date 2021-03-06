class Api::V1::EventsController < ApplicationController

  def show
    ## try fixing it so the fetch when the component mounts goes to a different route!!!
    # finding something in the external API and persisting
    event = Event.find_or_create_by(event_params)
    if !event.external_id && event.event_name_en
      event.external_id = params[:event][:id]
      event.save!

      # byebug
    # persist designers associated if they're sent through as params
      designers = params[:event][:designers]
      designers.each do |designer|
        new_designer = Designer.find_or_create_by(external_id: designer[:designer_id])
        new_designer.designer_name_en = designer[:designer_name]
        new_designer.designer_hero_card_url = designer[:designer_hero_card_url]
        new_designer.facebook = designer[:links][:facebook]
        new_designer.instagram = designer[:links][:instagram]
        new_designer.website = designer[:links][:website]
        new_designer.twitter = designer[:links][:twitter]
        new_designer.type_name = designer[:type_name]
        new_designer.slug = designer[:slug]
        event.designers << new_designer
        new_designer.save!
      end
      event.save!
    end
    render json: event.package_json
  end

  def create
    # creating a new UserEvent instance
    user = User.find_by(id: params[:user_id])
    event = Event.find_by(id: params[:event][:id])
    user.events << event
    render json:
    {
      user: user.package_json,
      currentEvent: event.package_json
    }
  end

  def destroy
    # deleting a UserEvent instance
    user = User.find_by(id: params[:user_id])
    event = Event.find_by(id: params[:id])
    user.user_events.find_by(event_id: event.id).delete
    render json:
    {
      user: user.package_json,
      currentEvent: event.package_json
    }
  end

  private
   def event_params
     params.require(:event).permit(:external_id, :address_business_name, :address_street_1, :address_street_2, :slug, :address_city, :address_zip, :event_name_en, :start_date, :end_date, :summary, :is_hot, :event_hero_url, :longitude, :latitude, :event_logo_pin)
   end
end
