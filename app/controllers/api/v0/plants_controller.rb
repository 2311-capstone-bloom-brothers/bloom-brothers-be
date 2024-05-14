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
    params.require(:plant).permit(:name, :description, :petal_color, :radius_top, :radius_bottom, :radial_segments, :rec_radius, :noise_scale, :noise_impact_x, :noise_impact_y, :noise_impact_z, :shape_height, :rec_position_y, :bloom_rotation_x, :bloom_rotation_y, :bloom_rotation_z, :stem_width, :stem_height, :stem_color, :life_cycle)
  end
end