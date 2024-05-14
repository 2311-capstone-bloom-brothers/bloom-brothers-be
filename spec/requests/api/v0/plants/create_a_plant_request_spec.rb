require "rails_helper"

RSpec.describe "Create A Plant", type: :request do
  describe "As a User" do

    before do
      @body = {
        name: "Tulip", 
        description: "The best flower created",
        petal_color: "#FFFF00",
        radius_top: 3, 
        radius_bottom: 10, 
        radial_segments: 8, 
        rec_radius: 4, 
        noise_scale: 6, 
        noise_impact_x: 3, 
        noise_impact_y: 10, 
        noise_impact_z: 8, 
        shape_height: 6, 
        rec_position_y: 3, 
        bloom_rotation_x: 4, 
        bloom_rotation_y: 10, 
        bloom_rotation_z: 8, 
        stem_width: 6, 
        stem_height: 3, 
        stem_color: "#00FF00", 
        life_cycle: 1
      }

      @bad_body = {
        name: "Tulip", 
        description: "",
        petal_color: "#FFFF00",
        radius_top: 3, 
        radius_bottom: 10, 
        radial_segments: 8, 
        rec_radius: 4, 
        noise_scale: 6, 
        noise_impact_x: 3, 
        noise_impact_y: 10, 
        noise_impact_z: 8, 
        shape_height: 6, 
        rec_position_y: 3, 
        bloom_rotation_x: 4, 
        bloom_rotation_y: 10, 
        bloom_rotation_z: 8, 
        stem_width: 6, 
        stem_height: 3, 
        stem_color: "#00FF00", 
        life_cycle: 1
      }

      @bad_body_2 = {
        name: "Tulip", 
        description: "The best flower created",
        petal_color: "#FFFF00",
        radius_top: 3, 
        radius_bottom: "", 
        radial_segments: 8, 
        rec_radius: 4, 
        noise_scale: 6, 
        noise_impact_x: 3, 
        noise_impact_y: 10, 
        noise_impact_z: 8, 
        shape_height: 6, 
        rec_position_y: 3, 
        bloom_rotation_x: 4, 
        bloom_rotation_y: 10, 
        bloom_rotation_z: 8, 
        stem_width: 6, 
        stem_height: 3, 
        stem_color: "#00FF00", 
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
      expect(attributes).to have_key(:radius_top)
      expect(attributes[:radius_top]).to eq(3)
      expect(attributes).to have_key(:petal_color)
      expect(attributes[:petal_color]).to eq("#FFFF00")
      expect(attributes).to have_key(:radius_bottom)
      expect(attributes[:radius_bottom]).to eq(10)
      expect(attributes).to have_key(:radial_segments)
      expect(attributes[:radial_segments]).to eq(8)
      expect(attributes).to have_key(:rec_radius)
      expect(attributes[:rec_radius]).to eq(4)
      expect(attributes).to have_key(:noise_scale)
      expect(attributes[:noise_scale]).to eq(6)
      expect(attributes).to have_key(:noise_impact_x)
      expect(attributes[:noise_impact_x]).to eq(3)
      expect(attributes).to have_key(:noise_impact_y)
      expect(attributes[:noise_impact_y]).to eq(10)
      expect(attributes).to have_key(:noise_impact_z)
      expect(attributes[:noise_impact_z]).to eq(8)
      expect(attributes).to have_key(:shape_height)
      expect(attributes[:shape_height]).to eq(6)
      expect(attributes).to have_key(:rec_position_y)
      expect(attributes[:rec_position_y]).to eq(3)
      expect(attributes).to have_key(:bloom_rotation_x)
      expect(attributes[:bloom_rotation_x]).to eq(4)
      expect(attributes).to have_key(:bloom_rotation_y)
      expect(attributes[:bloom_rotation_y]).to eq(10)
      expect(attributes).to have_key(:bloom_rotation_z)
      expect(attributes[:bloom_rotation_z]).to eq(8)
      expect(attributes).to have_key(:stem_width)
      expect(attributes[:stem_width]).to eq(6)
      expect(attributes).to have_key(:stem_height)
      expect(attributes[:stem_height]).to eq(3)
      expect(attributes).to have_key(:stem_color)
      expect(attributes[:stem_color]).to eq("#00FF00")
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
        expect(data[:errors].first[:detail]).to eq("Validation failed: Description can't be blank")
      end

      it "errors when an attribute that requires a number isn't entered in as a number" do 
        post "/api/v0/plants", headers: @headers, params: JSON.generate(@bad_body_2)

        expect(response).not_to be_successful
        expect(response.status).to eq(400)

        data = JSON.parse(response.body, symbolize_names: true)

        expect(data).to be_a(Hash)
        expect(data).to have_key(:errors)
        expect(data[:errors].first[:detail]).to eq("Validation failed: Radius bottom is not a number, Radius bottom can't be blank")
      end
    end
  end 
end