require "rails_helper"

RSpec.describe "Create A Plant", type: :request do
  describe "As a User" do
    before do
      @body = {
        name: "Rose",
        description: "The Flower Of Love",
        plant_type: "flower1",
        position: "A1"
      }
      @bad_body = {
        name: "",
        description: "The Flower Of Love",
        plant_type: "flower1",
        position: "A1"
      }
      @headers = {"CONTENT_TYPE" => "application/json"}
    end

    it "creates a new plant via HTTP request", vcr: { cassette_name: 'create_a_plant' } do
      post "/api/v0/plants", headers: @headers, params: JSON.generate(@body)
      
      expect(response).to be_successful
      expect(response.status).to eq(201)

      plant = JSON.parse(response.body, symbolize_names: true)
      
      check_hash_structure(plant, :data, Hash)
      check_hash_structure(plant[:data], :id, String)
      check_hash_structure(plant[:data], :type, String)
      check_hash_structure(plant[:data], :attributes, Hash)
      
      attributes = plant[:data][:attributes]
      expect(attributes).to have_key(:name)
      expect(attributes[:name]).to eq("Rose")
      expect(attributes).to have_key(:description)
      expect(attributes[:description]).to eq("The Flower Of Love")
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

    describe "Sad Path" do
      it "errors when not all required attributes are passed", vcr: { cassette_name: 'create_a_plant_sad_path' } do
        post "/api/v0/plants", headers: @headers, params: JSON.generate(@bad_body)

        expect(response).not_to be_successful
        expect(response.status).to eq(400)

        data = JSON.parse(response.body, symbolize_names: true)

        expect(data).to be_a(Hash)
        expect(data).to have_key(:errors)
        expect(data[:errors].first[:detail]).to eq("Validation failed: Name can't be blank")
      end
    end
  end
end
