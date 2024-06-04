require "rails_helper"

RSpec.describe "Get All User Plants", type: :request do
  describe "As a User" do
    before do
      @user = User.create!({email: "test@email.com", password: "PlantLord", location: "A Garden"})
    end

    it "gets all plants for a user via HTTP Request", vcr: { cassette_name: 'get_all_user_plants' } do
      plant_data_1 = PlantGenerationService.generate_plant("rose", "The Flower of love", "flower1", "A1")
      plant_data_2 = PlantGenerationService.generate_plant("Sun Flower", "Holds the power of the sun", "flower1", "A2")
      @plant_1 = Plant.create!(plant_data_1)
      @plant_2 = Plant.create!(plant_data_2)
      @user_plant_1 = UserPlant.create!({user_id: @user.id, plant_id: @plant_1.id})
      @user_plant_2 = UserPlant.create!({user_id: @user.id, plant_id: @plant_2.id})

      get "/api/v0/users/#{@user.id}/plants", headers: {
        "CONTENT_TYPE": "application/json",
        "ACCEPT": "application/json"
      }

      expect(response).to be_successful
      expect(response.status).to eq(200)

      result = JSON.parse(response.body, symbolize_names: true)
      expect(result).to be_a(Hash)
      expect(result).to have_key(:data)
      expect(result[:data]).to be_a(Array)
      expect(result[:data].count).to eq(2)

      result[:data].each do |plant|
        check_hash_structure(plant, :id, String)
        check_hash_structure(plant, :type, String)
        check_hash_structure(plant, :attributes, Hash)
        check_hash_structure(plant[:attributes], :name, String)
        check_hash_structure(plant[:attributes], :plant_type, String)
        check_hash_structure(plant[:attributes], :description, String)
        check_hash_structure(plant[:attributes], :lifespan, Integer)
        check_hash_structure(plant[:attributes], :planted, Integer)
        check_hash_structure(plant[:attributes], :position, String)
        check_hash_structure(plant[:attributes], :phases, Hash)
      end
    end

    describe "Sad Path" do
      it "errors when an id is invalid", vcr: { cassette_name: 'get_all_user_plants_sad_path' } do
        get "/api/v0/users/12345/plants", headers: {
          "CONTENT_TYPE": "application/json",
          "ACCEPT": "application/json"
        }

        expect(response).not_to be_successful
        expect(response.status).to eq(404)

        data = JSON.parse(response.body, symbolize_names: true)
        expect(data).to be_a(Hash)
        expect(data).to have_key(:errors)
        expect(data[:errors].first[:detail]).to eq("Couldn't find User with 'id'=12345")
      end
    end
  end
end
