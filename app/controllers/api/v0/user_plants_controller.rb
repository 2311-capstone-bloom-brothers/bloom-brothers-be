class Api::V0::UserPlantsController < ApplicationController 
  def index
    user = User.find(params[:user_id])
    render json: PlantSerializer.new(user.plants)
  end
end