require "rails_helper"

RSpec.describe "Get all Plants", type: :request do
  describe "As a user" do

    before do
      @plant_1 = Plant.create!({name: "Sun Flower", description: "The yellow flower that holds the power of the sun", petals: 5, petal_color: "#FFFF00", petal_length: 3, petal_width: 10, petal_height: 8, stem_length: 6, stem_width: 3, stem_height: 10, stem_color: "#00FF00", life_cycle: 1})
      @plant_2 = Plant.create!({name: "Wheat", description: "The grain that survives", petals: 1, petal_color: "964B00", petal_length: 1, petal_width: 2, petal_height: 4, stem_length: 8, stem_width: 4, stem_height: 9, stem_color: "964B00", life_cycle: 2})
    end

    it "returns all plant data via HTTP request" do
      get "/api/v0/plants"

      expect(response).to be_successful

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
  end 
end