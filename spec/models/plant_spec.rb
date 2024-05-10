require "rails_helper"

RSpec.describe Plant, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :description}
    it { should validate_presence_of :petals}
    it { should validate_numericality_of :petals}
    it { should validate_presence_of :petal_color}
    it { should validate_presence_of :petal_length}
    it { should validate_numericality_of :petal_length}
    it { should validate_presence_of :petal_width}
    it { should validate_numericality_of :petal_width}
    it { should validate_presence_of :petal_height}
    it { should validate_numericality_of :petal_height}
    it { should validate_presence_of :stem_color}
    it { should validate_presence_of :stem_length}
    it { should validate_numericality_of :stem_length}
    it { should validate_presence_of :stem_width}
    it { should validate_numericality_of :stem_width}
    it { should validate_presence_of :stem_height}
    it { should validate_numericality_of :stem_height}
    it { should validate_presence_of :life_cycle}


    it { should define_enum_for(:life_cycle).with_values([:seedling, :blooming, :thriving, :wilting, :dead])}
  end

  describe "relationships" do
    it {should have_many :user_plants}
    it {should have_many(:users).through(:user_plants)}
  end
end