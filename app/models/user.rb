class User < ApplicationRecord
  has_secure_password validations: false
  validates :username, uniqueness: true
  validates :name, presence: true

  has_many :user_events
  has_many :events, through: :user_events

  has_many :comments

  has_many :user_designers
  has_many :designers, through: :user_designers

  def package_json
    return {id: self.id,
    name: self.name,
    email: self.email,
    photo: self.photo,
    city_id: self.city_id,
    username: self.username,
    twitter: self.twitter,
    instagram: self.instagram,
    bio: self.bio,
    events: self.events,
    designers: self.designers }
  end

end
