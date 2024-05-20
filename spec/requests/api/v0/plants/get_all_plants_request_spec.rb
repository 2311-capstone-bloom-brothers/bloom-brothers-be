require "rails_helper"

RSpec.describe "Get all Plants", type: :request do
  describe "As a user" do

    before do
      plant_data_1 = PlantGenerator.create(name: "rose", description: "The Flower of love", plant_type: "flower1")
      plant_data_2 = PlantGenerator.create(name: "Sun Flower", description: "Holds the power of the sun", plant_type: "flower1")
      @plant = Plant.create!(plant_data_1)
      @plant_2 = Plant.create!(plant_data_2)
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
        check_hash_structure(plant[:attributes], :plant_type, String)
        check_hash_structure(plant[:attributes], :description, String)
        check_hash_structure(plant[:attributes], :lifespan, Integer)
        check_hash_structure(plant[:attributes], :planted, Integer)
        check_hash_structure(plant[:attributes], :phases, Hash)
      end
    end
  end 
end