class Api::V1::AuthController < ApplicationController

  def create
    user = User.find_by(username: params[:auth][:username])
    if user && user.authenticate(params[:auth][:password])
       # issue user a token
      payload = {user_id: user.id}
      token = JWT.encode(payload, ENV["MY_SECRET"], ENV["KENNITH"])
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
        bio: user.bio
       }

    else
      render json: {error: "Could not authorize this user"}, status: 401
    end
  end

  def show
    byebug
    token = request.headers['Authorization']
    decoded_token =  JWT.decode(token, ENV['MY_SECRET'], true, { :algorithm => ENV['AYREAL'] })
    # => [{"user_id"=>23}, {"alg"=>"HS256"}]
    user_id = decoded_token.first['user_id']
    user = User.find_by(id: user_id)
    if user
      render json: {
        id: user.id,
        name: user.name,
        username:user.username,
        gender_choice: user.gender_choice,
        interests: user.interests,
        matches: user.matches,
        location: user.location
      }
    else
      render json: {error: "Could not find this user. Username or password is incorrect."}, status: 401
    end
  end

end