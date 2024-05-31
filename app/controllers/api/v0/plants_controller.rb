class Api::V0::PlantsController < ApplicationController
  def index
    plants = Plant.all
    render json: PlantSerializer.new(plants)
  end

  def create
    plant_name = params[:name]
    description = params[:description]
    type = params[:plant_type]

    generated_plant = PlantGenerationService.generate_plant(plant_name, description, type)
    create_plant = Plant.create!(generated_plant)

    render json: PlantSerializer.new(create_plant), status: 201
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :description, :lifespan, :planted, :phases, :plant_type)
  end
end
