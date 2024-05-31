class Api::V0::PlantsController < ApplicationController
  def index
    plants = Plant.all 
    render json: PlantSerializer.new(plants)
  end

  def create
    plant_name = params[:name]
    description = params[:description]
    type = params[:plant_type]
    plant = PlantGenerator.create(name: plant_name, description: description, plant_type: type)
    create_plant = Plant.create!(plant)
    render json: PlantSerializer.new(create_plant), status: 201
  end

  def destroy
    plant = Plant.find(params[:id])
    render json: plant.destroy, status: 204
  end

  private 

  def plant_params
    params.require(:plant).permit(:name, :description, :lifespan, :planted, :phases, :plant_type)
  end
end