class Api::V1::DesignersController < ApplicationController
  def create
    # byebug
    # creating a new UserDesigner instance
    user = User.find_by(id: params[:user_id])
    designer = Designer.find_by(id: params[:designer][:id])
    user.designers << designer
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
      events: user.events,
      designers: user.designers
    }
  end

  def destroy
    # deleting a UserDesigner instance
    user = User.find_by(id: params[:user_id])
    designer = Designer.find_by(id: params[:id])
    user.user_designers.find_by(designer_id: designer.id).delete
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
      events: user.events,
      designers: user.designers
    }
  end
end
