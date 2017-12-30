class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users.to_json(include: [:designers, :events])
  end

  def create
     user = User.new(user_params)
     user.password = params[:password]
     if user.valid?
       user.save
       payload = {user_id: user.id}
       token = JWT.encode(payload, ENV["MY_SECRET"], ENV["ALG"])
       render json: {
         token: token,
         id: user.id,
         name: user.name,
         email: user.email,
         photo: user.photo,
         city_id: user.city_id,
         username: user.username,
         twitter: user.twitter,
         instagram: user.instagram,
         bio: user.bio,
         events: user.events,
         designers: user.designers

        }
     else
       render json: {error: "Could not authorize this user"}, status: 401
     end
   end

  private
   def user_params
     params.require(:user).permit(:name, :email, :photo, :city_id, :username, :twitter, :instagram, :bio)
   end

end
