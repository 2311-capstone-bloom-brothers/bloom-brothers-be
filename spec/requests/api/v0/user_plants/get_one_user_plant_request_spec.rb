require "rails_helper"

RSpec.describe "Get one user plant", type: :request, vcr: true do
  describe "As a User" do

    before do
      @user = User.create!({email: "test@email.com", password: "PlantLord", location: "A Garden"})
      plant_1_name = "Rose"
      plant_1_description = "The Flower of love"
      plant_1_type = "flower1"
      position = "A1"
      plant_2_name = "Sun Flower"
      plant_2_description = "The power of the sun"
      plant_2_type = "flower1"
      position_2 = "A2"

      plant_data_1 = PlantGenerationService.generate_plant(plant_1_name, plant_1_description, plant_1_type, position)
      plant_data_2 = PlantGenerationService.generate_plant(plant_2_name, plant_2_description, plant_2_type, position_2)
      @plant_1 = Plant.create!(plant_data_1)
      @plant_2 = Plant.create!(plant_data_2)
      @user_plant_1 = UserPlant.create!({user_id: @user.id, plant_id: @plant_1.id})
      @headers = {
        "CONTENT_TYPE": "application/json",
        "ACCEPT": "application/json"
      }
    end

    it "gets one plant for a user via HTTP request" do
      get "/api/v0/users/#{@user.id}/plants/#{@plant_1.id}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      plant = JSON.parse(response.body, symbolize_names: true)

      check_hash_structure(plant, :data, Hash)
      check_hash_structure(plant[:data], :id, String)
      check_hash_structure(plant[:data], :type, String)
      check_hash_structure(plant[:data], :attributes, Hash)

      attributes = plant[:data][:attributes]
      expect(attributes).to have_key(:name)
      expect(attributes[:name]).to eq("Rose")
      expect(attributes).to have_key(:description)
      expect(attributes[:description]).to eq("The Flower of love")
      expect(attributes).to have_key(:plant_type)
      expect(attributes[:plant_type]).to eq("flower1")
      expect(attributes).to have_key(:planted)
      expect(attributes[:planted]).to be_a(Integer)
      expect(attributes).to have_key(:lifespan)
      expect(attributes[:lifespan]).to eq(86400000)
      expect(attributes).to have_key(:position)
      expect(attributes[:position]).to eq("A1")
      expect(attributes).to have_key(:phases)
      expect(attributes[:phases]).to be_a(Hash)
    end
  end
end
