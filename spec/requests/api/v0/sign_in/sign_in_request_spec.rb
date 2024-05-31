require "rails_helper"

RSpec.describe "Sign In a User", type: :request do
  describe "As a User" do

    before do
      @user = create(:user, password: "testing")
      @params = {
        email: @user.email,
        password: "testing", 
      }

      @bad_params = {
        email: @user.email,
        password: "WrongPassword",
        type: "Sign In as User"
      }
      @headers = {"CONTENT_TYPE" => "application/json"}
    end

    it "allows users to sign in VIA HTTP REQUEST" do
      post "/api/v0/sign_in", headers: @headers, params: JSON.generate(@params)

      expect(response).to be_successful
      data = JSON.parse(response.body, symbolize_names: true)

      check_hash_structure(data, :data, Hash)
      check_hash_structure(data[:data], :id, Integer)
      expect(data[:data][:id]).to eq(@user.id)
    end

    describe "sad path" do 
      it "errors when the password is incorrect" do 
        post "/api/v0/sign_in", headers: @headers, params: JSON.generate(@bad_params)

        expect(response).not_to be_successful
        expect(response.status).to eq(422)

        data = JSON.parse(response.body, symbolize_names: true)

        expect(data).to have_key(:error)
        expect(data[:error]).to eq("Invalid Parameters for Sign In")
      end
    end
  end 
end