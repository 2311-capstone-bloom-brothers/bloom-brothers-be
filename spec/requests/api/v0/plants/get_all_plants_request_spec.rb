require "rails_helper"

RSpec.describe "Get all Plants", type: :request do
  describe "As a user" do

    before do
      @plant_1 = Plant.create!({ name: "Sun Flower",
      description: "The yellow flower that holds the power of the sun", petal_color: "#FFFF00", radius_top: 3, radius_bottom: 10, radial_segments: 8, rec_radius: 4, noise_scale: 6, noise_impact_x: 3, noise_impact_y: 10, noise_impact_z: 8, shape_height: 6, rec_position_y: 3, bloom_rotation_x: 4, bloom_rotation_y: 10, bloom_rotation_z: 8, stem_width: 6, stem_height: 3, stem_color: "#00FF00", life_cycle: 1})
      @plant_2 = Plant.create!({name: "Wheat", description: "The grain that survives", petal_color: "964B00", radius_top: 1, radius_bottom: 2, radial_segments: 4, rec_radius: 8, noise_scale: 4, noise_impact_x: 8, noise_impact_y: 4, noise_impact_z: 9, shape_height: 8, rec_position_y: 4, bloom_rotation_x: 8, bloom_rotation_y: 4, bloom_rotation_z: 9, stem_width: 8, stem_height: 4, stem_color: "964B00", life_cycle: 2})
    end

    it "returns all plant data via HTTP request" do
      get "/api/v0/plants"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      plants = JSON.parse(response.body, symbolize_names: true)
      expect(plants).to be_a(Hash)
      expect(plants).to have_key(:data)
      expect(plants[:data]).to be_a(Array)
      expect(plants[:data].count).to eq(2)
      
      plants[:data].each do |plant|
        check_hash_structure(plant, :id, String)
        check_hash_structure(plant, :type, String)
        check_hash_structure(plant, :attributes, Hash)
        check_hash_structure(plant[:attributes], :name, String)
        check_hash_structure(plant[:attributes], :description, String)
        check_hash_structure(plant[:attributes], :petal_color, String)
        check_hash_structure(plant[:attributes], :stem_color, String)
        check_hash_structure(plant[:attributes], :radius_top, Float)
        check_hash_structure(plant[:attributes], :radius_bottom, Float)
        check_hash_structure(plant[:attributes], :radial_segments, Float)
        check_hash_structure(plant[:attributes], :rec_radius, Float)
        check_hash_structure(plant[:attributes], :noise_scale, Float)
        check_hash_structure(plant[:attributes], :noise_impact_x, Float)
        check_hash_structure(plant[:attributes], :noise_impact_y, Float)
        check_hash_structure(plant[:attributes], :noise_impact_z, Float)
        check_hash_structure(plant[:attributes], :shape_height, Float)
        check_hash_structure(plant[:attributes], :rec_position_y, Float)
        check_hash_structure(plant[:attributes], :bloom_rotation_x, Float)
        check_hash_structure(plant[:attributes], :bloom_rotation_y, Float)
        check_hash_structure(plant[:attributes], :bloom_rotation_z, Float)
        check_hash_structure(plant[:attributes], :stem_width, Float)
        check_hash_structure(plant[:attributes], :stem_height, Float)
        check_hash_structure(plant[:attributes], :life_cycle, String)
      end
    end
  end 
end