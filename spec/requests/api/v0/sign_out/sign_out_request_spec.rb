require "rails_helper"

RSpec.describe "Sign Out", type: :request do
  describe "As a User" do

    before do
      @user = create(:user, password: "testing")
      @params = {
        email: @user.email,
        password: "testing"
      }
      @sign_out_params = {user_id: @user.id}
      @bad_params = {}
      @headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v0/sign_in", headers: @headers, params: JSON.generate(@params) 
    end

    it "signs out via delete request" do
      delete "/api/v0/sign_out", headers: @headers, params: JSON.generate(@sign_out_params)

      expect(response).to be_successful
      expect(response.status).to eq(204)
    end

    describe '#sad path' do
      it 'returns the correct status when sent invalid parameters for signing out a user' do
        delete "/api/v0/sign_out", headers: @headers, params: JSON.generate(@bad_params)

        expect(response).not_to be_successful
        expect(response.status).to eq(404)
      end
    end
  end 
end