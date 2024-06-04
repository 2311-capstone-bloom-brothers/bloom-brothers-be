class Api::V0::BreedingController < ApplicationController
  def create 
    new_plant = {
      name: params[:name], 
      description: params[:description], 
      lifespan: params[:lifespan],
      planted: params[:planted],
      plant_type: params[:plant_type],
      position: params[:position],
      phases: params[:phases]
    }
    plant = Plant.create!(new_plant)
    render json: PlantSerializer.new(plant), status: 201
  end
end