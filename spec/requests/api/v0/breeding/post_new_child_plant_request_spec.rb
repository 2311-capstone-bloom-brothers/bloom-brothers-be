# require "rails_helper"

# RSpec.describe "Breed a Plant from 2 plants", type: :request do
#   describe "As a User" do

#     before do
#       @body = {
#         name: "My Parents made me",
#         description: "Does breeding work",
#         lifespan: 1,
#         planted: 1717184430,
#         plant_type: "combo_of_flower_1&2",
#         position: "A1",
#         phases: {
#           stem: {
#             color: [0, 100, 0],
#             stemWidth: [0.5, 0.5, 0.5, 0.5, 0.5],
#             path: [
#               [[0.6, 0, 0], [0.6, 0, 0], [0.6, 0, 0.8], [0.2, 0.8, 0], [0.2, 0.8, 0], [0.2, 0.8, 0], [0.2, 0.8, 0], [0.2, 0.8, 0]],
#               [[0.6, 0, 0], [0.6, 0, 0], [0.6, 0, 0.8], [0.2, 1.76, 0], [0.2, 1.76, 0], [0.2, 1.76, 0], [0.2, 1.76, 0], [0.2, 1.76, 0]],
#               [[0.6, 0, 0], [0.6, 0, 0], [0.6, 0, 0.8], [0.2, 7, 0], [0.2, 7, 0], [0.2, 7, 0], [0.2, 7, 0], [0.2, 7, 0]],
#               [[0.6, 0, 0], [0.6, 0, 0], [0.6, 0, 0.56], [0.2, 4.5, 0.88], [0.2, 7.46, 1.42], [0.2, 8.34, 1.08], [0.2, 8.42, 0], [0.2, 7.08, -0.26]],
#               [[0.6, 0, 0], [0.6, 0, 0], [0.6, 0, 0.56], [0.2, 2.5, 0.88], [0.2, 5.46, 1.42], [0.2, 6.34, 1.08], [0.2, 6.42, 0], [0.2, 5.08, -0.26]]
#             ]
#           },
#           bloom: {
#             color: [80, 100, 50],
#             petalCount: [2, 2, 2, 2, 2],
#             recRadius: [0.12, 0.14, 0.16, 0.18, 0.16],
#             radiusTop: [0.25, 0.40, 0.90, 1.00, 0.85],
#             radiusBottom: [0.25, 0.42, 0.95, 1.00, 0.32],
#             noiseScale: [0.40, 1.10, 1.30, 1.20, 0.11],
#             noiseImpactX: [0.40, 0.42, 0.45, 0.45, 0.41],
#             noiseImpactY: [0.30, 0.40, 0.45, 1.00, 2.50],
#             noiseImpactZ: [0, 0, 0.95, 0.95, 0.90],
#             height: [0.14, 0.08, 0.03, 0.03, 0.01],
#             radialSegments: [90, 90, 90, 20, 10],
#             rotation: [[0, 0, 0], [0.03, 0, 0], [-0.35, 0.07, -0.40], [-0.35, 0.07, 0.07], [-0.68, 0.07, -0.40]]
#           }
#         }
#       }

#       @headers = {
#         "CONTENT_TYPE": "application/json",
#         "ACCEPT": "application/json"
#       }
#     end

#     it "creates a new plant" do
#       post "/api/v0/breeding", headers: @headers, params: JSON.generate(@body)

#       expect(response).to be_successful
#       expect(response.status).to eq(201)

#       plant = JSON.parse(response.body, symbolize_names: true)

#       check_hash_structure(plant, :data, Hash)
#       check_hash_structure(plant[:data], :id, String)
#       check_hash_structure(plant[:data], :type, String)
#       check_hash_structure(plant[:data], :attributes, Hash)

#       attributes = plant[:data][:attributes]
#       expect(attributes).to have_key(:name)
#       expect(attributes[:name]).to eq("My Parents made me")
#       expect(attributes).to have_key(:description)
#       expect(attributes[:description]).to eq("Does breeding work")
#       expect(attributes).to have_key(:plant_type)
#       expect(attributes[:plant_type]).to eq("combo_of_flower_1&2")
#       expect(attributes).to have_key(:planted)
#       expect(attributes[:planted]).to eq(1717184430)
#       expect(attributes).to have_key(:lifespan)
#       expect(attributes[:lifespan]).to eq(1)
#       expect(attributes).to have_key(:position)
#       expect(attributes[:position]).to eq("A1")
#       expect(attributes).to have_key(:phases)
#       expect(attributes[:phases]).to be_a(Hash)
#     end
#   end
# end
