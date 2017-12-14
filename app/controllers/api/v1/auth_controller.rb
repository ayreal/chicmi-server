class Api::V1::AuthController < ApplicationController

  def create
    user = User.find_by(username: params[:auth][:username])
    if user && user.authenticate(params[:auth][:password])
       # issue user a token
      payload = {user_id: user.id}
      token = JWT.encode(payload, ENV["MY_SECRET"], ENV["KENNITH"])
      render json: { token: token , currentUser: user}
    else
      render json: {error: "Could not authorize this user"}, status: 401
    end
  end
  
end
