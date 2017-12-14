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


      # create_table "users", force: :cascade do |t|
      #   t.string "name"
      #   t.string "email"
      #   t.string "photo"
      #   t.integer "city_id"
      #   t.string "username"
      #   t.string "twitter"
      #   t.string "instagram"
      #   t.text "bio"
      #   t.string "password_digest"
      #   t.datetime "created_at", null: false
      #   t.datetime "updated_at", null: false
      # end
      #
    else
      render json: {error: "Could not authorize this user"}, status: 401
    end
  end

end
