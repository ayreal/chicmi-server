class Api::V1::DesignersController < ApplicationController
  def create
    # byebug
    # creating a new UserDesigner instance
    user = User.find_by(id: params[:user_id])
    designer = Designer.find_by(id: params[:designer][:id])
    user.designers << designer
    render json: user.package_json
  end

  def destroy
    # deleting a UserDesigner instance
    user = User.find_by(id: params[:user_id])
    designer = Designer.find_by(id: params[:id])
    user.user_designers.find_by(designer_id: designer.id).delete
    render json: user.package_json
  end
end
