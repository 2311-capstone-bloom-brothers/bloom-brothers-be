require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :email}
    it { should validate_presence_of :location}
    it { should validate_presence_of :password}
  end

  describe "relationships" do
    it {should have_many :user_plants}
    it {should have_many(:plants).through(:user_plants)}
  end
end