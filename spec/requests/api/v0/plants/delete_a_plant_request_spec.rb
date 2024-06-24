# require "rails_helper"

# RSpec.describe "Delete a plant", type: :request, vcr: true do
#   describe "As a User" do

#     before do
#       plant_1_name = "Rose"
#       plant_1_description = "The Flower of love"
#       plant_1_type = "flower1",
#       position = "A1"
#       plant_2_name = "Sun Flower"
#       plant_2_description = "The power of the sun"
#       plant_2_type = "flower1",
#       position_2 = "A2"

#       plant_data_1 = PlantGenerationService.generate_plant(plant_1_name, plant_1_description, plant_1_type, position)
#       plant_data_2 = PlantGenerationService.generate_plant(plant_2_name, plant_2_description, plant_2_type, position_2)
#       @plant = Plant.create!(plant_data_1)
#       @plant_2 = Plant.create!(plant_data_2)
#     end

#     it "deletes a plant via HTTP request", :vcr do
#       expect(Plant.count).to eq(2)

#       delete "/api/v0/plants/#{@plant.id}"

#       expect(response).to be_successful
#       expect(response.status).to eq(204)
#       expect(Plant.count).to eq(1)
#       expect{ Plant.find(@plant.id) }.to raise_error(ActiveRecord::RecordNotFound)
#     end

#     describe "sad path" do
#       it "will return the correct message and status when given a user id that does not exist", :vcr do
#         delete "/api/v0/plants/#{@plant.id}"

#         delete "/api/v0/plants/#{@plant.id}"

#         expect(response).not_to be_successful

#         error_response = JSON.parse(response.body, symbolize_names: true)

#         expect(error_response).to have_key(:errors)
#         expect(error_response[:errors]).to be_a(Array)

#         expect(error_response[:errors].first).to have_key(:detail)
#         expect(error_response[:errors].first[:detail]).to eq("Couldn't find Plant with 'id'=#{@plant.id}")
#       end
#     end
#   end
# end
