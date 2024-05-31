require "rails_helper"

RSpec.describe "Delete a plant", type: :request do
  describe "As a User" do

    before do
      plant_data_1 = PlantGenerator.create(name: "rose", description: "The Flower of love", plant_type: "flower1")
      plant_data_2 = PlantGenerator.create(name: "Sun Flower", description: "Holds the power of the sun", plant_type: "flower1")
      @plant = Plant.create!(plant_data_1)
      @plant_2 = Plant.create!(plant_data_2)
    end

    it "deletes a plant via HTTP request" do
      expect(Plant.count).to eq(2)

      delete "/api/v0/plants/#{@plant.id}" 

      expect(response).to be_successful
      expect(response.status).to eq(204)
      expect(Plant.count).to eq(1)
      expect{ Plant.find(@plant.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end

    describe "sad path" do 
      it "will return the correct message and status when given a user id that does not exist" do 
        delete "/api/v0/plants/#{@plant.id}"
    
        delete "/api/v0/plants/#{@plant.id}"

        expect(response).not_to be_successful
        
        error_response = JSON.parse(response.body, symbolize_names: true)

        expect(error_response).to have_key(:errors)
        expect(error_response[:errors]).to be_a(Array)

        expect(error_response[:errors].first).to have_key(:detail)
        expect(error_response[:errors].first[:detail]).to eq("Couldn't find Plant with 'id'=#{@plant.id}")
      end
    end
  end 
end