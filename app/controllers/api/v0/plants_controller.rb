class Api::V0::PlantsController < ApplicationController
  def index
    plants = Plant.all 
    render json: PlantSerializer.new(plants)
  end

  def create
    plant = Plant.create!(plant_params)
    render json: PlantSerializer.new(plant), status: 201
  end

  private 

  def plant_params
    params.require(:plant).permit(:name, :description, :petals, :petal_color, :petal_length, :petal_width, :petal_height, :stem_length, :stem_width, :stem_height, :stem_color, :life_cycle)
  end
end