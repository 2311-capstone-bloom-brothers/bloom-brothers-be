require "rails_helper"

RSpec.describe "Create A Plant", type: :request do
  describe "As a User" do

    before do
      @body = {
        name: "Tulip", 
        description: "The best flower created",  
        petals: 3,
        petal_color: "#0d2365", 
        petal_length: 5,
        petal_width: 20,
        petal_height: 30,
        stem_length: 5,
        stem_width: 12,
        stem_height: 9,
        stem_color: "#0d2365",
        life_cycle: 1
      }

      @bad_body = {
        name: "Tulip", 
        description: "",  
        petals: 3,
        petal_color: "", 
        petal_length: 5,
        petal_width: 20,
        petal_height: 30,
        stem_length: 5,
        stem_width: 12,
        stem_height: 9,
        stem_color: "#0d2365",
        life_cycle: 1
      }

      @bad_body_2 = {
        name: "Tulip", 
        description: "The best flower created",  
        petals: "",
        petal_color: "#0d2365", 
        petal_length: "Blue",
        petal_width: 20,
        petal_height: 30,
        stem_length: 5,
        stem_width: 12,
        stem_height: 9,
        stem_color: "#0d2365",
        life_cycle: 1
      }
      @headers = {"CONTENT_TYPE" => "application/json"}
    end

    it "creates a new plant via HTTP request" do
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
      expect(attributes[:name]).to eq("Tulip")
      expect(attributes).to have_key(:description)
      expect(attributes[:description]).to eq("The best flower created")
      expect(attributes).to have_key(:petals)
      expect(attributes[:petals]).to eq(3)
      expect(attributes).to have_key(:petal_color)
      expect(attributes[:petal_color]).to eq("#0d2365")
      expect(attributes).to have_key(:petal_length)
      expect(attributes[:petal_length]).to eq(5)
      expect(attributes).to have_key(:petal_width)
      expect(attributes[:petal_width]).to eq(20)
      expect(attributes).to have_key(:petal_height)
      expect(attributes[:petal_height]).to eq(30)
      expect(attributes).to have_key(:stem_length)
      expect(attributes[:stem_length]).to eq(5)
      expect(attributes).to have_key(:stem_width)
      expect(attributes[:stem_width]).to eq(12)
      expect(attributes).to have_key(:stem_height)
      expect(attributes[:stem_height]).to eq(9)
      expect(attributes).to have_key(:stem_color)
      expect(attributes[:stem_color]).to eq("#0d2365")
      expect(attributes).to have_key(:life_cycle)
      expect(attributes[:life_cycle]).to eq("blooming")
    end

    describe "Sad Path" do 
      it "errors when not all required attributes are passed" do 
        post "/api/v0/plants", headers: @headers, params: JSON.generate(@bad_body)

        expect(response).not_to be_successful
        expect(response.status).to eq(400)

        data = JSON.parse(response.body, symbolize_names: true)

        expect(data).to be_a(Hash)
        expect(data).to have_key(:errors)
        expect(data[:errors].first[:detail]).to eq("Validation failed: Description can't be blank, Petal color can't be blank")
      end

      it "errors when an attribute that requires a number isn't entered in as a number" do 
        post "/api/v0/plants", headers: @headers, params: JSON.generate(@bad_body_2)

        expect(response).not_to be_successful
        expect(response.status).to eq(400)

        data = JSON.parse(response.body, symbolize_names: true)

        expect(data).to be_a(Hash)
        expect(data).to have_key(:errors)
        expect(data[:errors].first[:detail]).to eq("Validation failed: Petals is not a number, Petals can't be blank, Petal length is not a number")
      end
    end
  end 
end