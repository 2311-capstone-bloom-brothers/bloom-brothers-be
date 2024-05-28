class Api::V0::UserPlantsController < ApplicationController 
  def index
    user = User.find(params[:user_id])
    render json: PlantSerializer.new(user.plants)
  end

  def show
    user = User.find(params[:user_id])
    plant = Plant.find(params[:id])
    render json: PlantSerializer.new(plant)
  end
end