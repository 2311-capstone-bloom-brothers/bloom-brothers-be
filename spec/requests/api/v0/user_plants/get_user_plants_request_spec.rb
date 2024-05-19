require "rails_helper"

RSpec.describe "Get All User Plants", type: :request do
  describe "As a User" do

    before do
      @user = User.create!({email: "test@email.com", password: "PlantLord", location: "A Garden"})
      @plant_1 = Plant.create!({ name: "Sun Flower",
      description: "The yellow flower that holds the power of the sun", petal_color: "#FFFF00", radius_top: 3, radius_bottom: 10, radial_segments: 8, rec_radius: 4, noise_scale: 6, noise_impact_x: 3, noise_impact_y: 10, noise_impact_z: 8, shape_height: 6, rec_position_y: 3, bloom_rotation_x: 4, bloom_rotation_y: 10, bloom_rotation_z: 8, stem_width: 6, stem_height: 3, stem_color: "#00FF00", life_cycle: 1})
      @plant_2 = Plant.create!({name: "Wheat", description: "The grain that survives", petal_color: "964B00", radius_top: 1, radius_bottom: 2, radial_segments: 4, rec_radius: 8, noise_scale: 4, noise_impact_x: 8, noise_impact_y: 4, noise_impact_z: 9, shape_height: 8, rec_position_y: 4, bloom_rotation_x: 8, bloom_rotation_y: 4, bloom_rotation_z: 9, stem_width: 8, stem_height: 4, stem_color: "964B00", life_cycle: 2})
      @plant_3 = Plant.create!({name: "Lilac", description: "Speaks for the Lorax", petal_color: "#964B00", radius_top: 3, radius_bottom: 4, radial_segments: 4, rec_radius: 8, noise_scale: 4, noise_impact_x: 8, noise_impact_y: 4, noise_impact_z: 9, shape_height: 8, rec_position_y: 4, bloom_rotation_x: 8, bloom_rotation_y: 4, bloom_rotation_z: 9, stem_width: 8, stem_height: 4, stem_color: "#964B00", life_cycle: 2})
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
        check_hash_structure(plant[:attributes], :petal_color, String)
        check_hash_structure(plant[:attributes], :stem_color, String)
        check_hash_structure(plant[:attributes], :radius_top, Float)
        check_hash_structure(plant[:attributes], :radius_bottom, Float)
        check_hash_structure(plant[:attributes], :radial_segments, Float)
        check_hash_structure(plant[:attributes], :rec_radius, Float)
        check_hash_structure(plant[:attributes], :noise_scale, Float)
        check_hash_structure(plant[:attributes], :noise_impact_x, Float)
        check_hash_structure(plant[:attributes], :noise_impact_y, Float)
        check_hash_structure(plant[:attributes], :noise_impact_z, Float)
        check_hash_structure(plant[:attributes], :shape_height, Float)
        check_hash_structure(plant[:attributes], :rec_position_y, Float)
        check_hash_structure(plant[:attributes], :bloom_rotation_x, Float)
        check_hash_structure(plant[:attributes], :bloom_rotation_y, Float)
        check_hash_structure(plant[:attributes], :bloom_rotation_z, Float)
        check_hash_structure(plant[:attributes], :stem_width, Float)
        check_hash_structure(plant[:attributes], :stem_height, Float)
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