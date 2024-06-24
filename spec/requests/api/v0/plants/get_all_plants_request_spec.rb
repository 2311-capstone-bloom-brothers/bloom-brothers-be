# require "rails_helper"

# RSpec.describe "Get all Plants", type: :request do
#   describe "As a user" do
#     it "returns all plant data via HTTP request", vcr: { cassette_name: 'get_all_plants' } do
#       plant_data_1 = PlantGenerationService.generate_plant("rose", "The Flower of love", "flower1", "A1")
#       plant_data_2 = PlantGenerationService.generate_plant("Sun Flower", "Holds the power of the sun", "flower1", "A2")
#       @plant = Plant.create!(plant_data_1)
#       @plant_2 = Plant.create!(plant_data_2)

#       get "/api/v0/plants"

#       expect(response).to be_successful
#       expect(response.status).to eq(200)

#       plants = JSON.parse(response.body, symbolize_names: true)
#       expect(plants).to be_a(Hash)
#       expect(plants).to have_key(:data)
#       expect(plants[:data]).to be_a(Array)
#       expect(plants[:data].count).to eq(2)

#       plants[:data].each do |plant|
#         check_hash_structure(plant, :id, String)
#         check_hash_structure(plant, :type, String)
#         check_hash_structure(plant, :attributes, Hash)
#         check_hash_structure(plant[:attributes], :name, String)
#         check_hash_structure(plant[:attributes], :plant_type, String)
#         check_hash_structure(plant[:attributes], :description, String)
#         check_hash_structure(plant[:attributes], :lifespan, Integer)
#         check_hash_structure(plant[:attributes], :planted, Integer)
#         check_hash_structure(plant[:attributes], :position, String)
#         check_hash_structure(plant[:attributes], :phases, Hash)
#       end
#     end
#   end
# end
