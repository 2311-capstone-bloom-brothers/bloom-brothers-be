require "rails_helper"

RSpec.describe "Get All User Plants", type: :request do
  describe "As a User" do

    before do
      @user = User.create!({email: "test@email.com", password: "PlantLord", location: "A Garden"})
      @plant_1 = Plant.create!({name: "Sun Flower", description: "The yellow flower that holds the power of the sun", petals: 5, petal_color: "#FFFF00", petal_length: 3, petal_width: 10, petal_height: 8, stem_length: 6, stem_width: 3, stem_height: 10, stem_color: "#00FF00", life_cycle: 1})
      @plant_2 = Plant.create!({name: "Wheat", description: "The grain that survives", petals: 1, petal_color: "964B00", petal_length: 1, petal_width: 2, petal_height: 4, stem_length: 8, stem_width: 4, stem_height: 9, stem_color: "964B00", life_cycle: 2})
      @plant_3 = Plant.create!({name: "Rose", description: "The flower of love", petals: 1, petal_color: "#FF0000", petal_length: 1, petal_width: 5, petal_height: 3, stem_length: 4, stem_width: 4, stem_height: 9, stem_color: "#FF0000", life_cycle: 3})
      @user_plant_1 = UserPlant.create!({user_id: @user.id, plant_id: @plant_1.id})
      @user_plant_2 = UserPlant.create!({user_id: @user.id, plant_id: @plant_2.id})
      @headers = {
        "CONTENT_TYPE": "application/json",
        "ACCEPT": "application/json"
      }
    end

    it "gets all plants for a user via HTTP Request" do
      get "/api/v0/users/#{@user.id}/plants", headers: @headers
      
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
        check_hash_structure(plant[:attributes], :description, String)
        check_hash_structure(plant[:attributes], :petals, Integer)
        check_hash_structure(plant[:attributes], :petal_color, String)
        check_hash_structure(plant[:attributes], :petal_length, Integer)
        check_hash_structure(plant[:attributes], :petal_width, Integer)
        check_hash_structure(plant[:attributes], :petal_height, Integer)
        check_hash_structure(plant[:attributes], :stem_length, Integer)
        check_hash_structure(plant[:attributes], :stem_width, Integer)
        check_hash_structure(plant[:attributes], :stem_height, Integer)
        check_hash_structure(plant[:attributes], :stem_color, String)
        check_hash_structure(plant[:attributes], :life_cycle, String)
      end
    end

    describe "Sad Path" do 
      it "errors when an id is invalid" do 
        get "/api/v0/users/12345/plants", headers: @headers

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