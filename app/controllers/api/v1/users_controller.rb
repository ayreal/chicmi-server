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
         user: user.package_json

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
