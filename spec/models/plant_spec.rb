require "rails_helper"

RSpec.describe Plant, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :description}
    it { should validate_presence_of :plant_type}
    it { should validate_presence_of :lifespan}
    it { should validate_numericality_of :lifespan}
    it { should validate_presence_of :planted}
    it { should validate_numericality_of :planted}
    it { should validate_presence_of :phases}
  end

  describe "relationships" do
    it {should have_many :user_plants}
    it {should have_many(:users).through(:user_plants)}
  end
end