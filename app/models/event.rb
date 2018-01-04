class Event < ApplicationRecord
  validates :event_name_en, presence: true
  has_many :user_events
  has_many :users, through: :user_events

  has_many :comments

  has_many :designer_events
  has_many :designers, through: :designer_events

  def package_json
    return {
      id: self.id,
      external_id: self.external_id,
      address_business_name: self.address_business_name,
      address_street_1: self.address_street_1,
      address_street_2: self.address_street_2,
      slug: self.slug,
      address_city: self.address_city,
      address_zip: self.address_zip,
      event_name_en: self.event_name_en,
      start_date: self.start_date,
      end_date: self.end_date,
      summary: self.summary,
      is_hot: self.is_hot,
      attending:self.user_event_count,
      created_at: self.created_at,
      updated_at: self.updated_at,
      event_hero_url: self.event_hero_url,
      longitude: self.longitude,
      latitude: self.latitude,
      event_logo_pin: self.event_logo_pin,
      comments: self.comments_to_json,
      designers: self.designers
    }
  end

  def comments_to_json
    return self.comments.map do |comment|
      {
        id: comment.id,
        name: comment.user.name,
        photo: comment.user.photo,
        user_id: comment.user_id,
        event_id: comment.event_id,
        created_at: comment.created_at,
        text: comment.text
       }
    end

  end

  def user_event_count
    self.user_events.all.count
  end



end
