require "rails_helper"

RSpec.describe Plant, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :description}
    it { should validate_presence_of :petal_color}
    it { should validate_presence_of :stem_color}
    it { should validate_presence_of :radius_top}
    it { should validate_numericality_of :radius_top}
    it { should validate_presence_of :radius_bottom}
    it { should validate_numericality_of :radius_bottom}
    it { should validate_presence_of :radial_segments}
    it { should validate_numericality_of :radial_segments}
    it { should validate_presence_of :rec_radius}
    it { should validate_numericality_of :rec_radius}
    it { should validate_presence_of :noise_scale}
    it { should validate_numericality_of :noise_scale}
    it { should validate_presence_of :noise_impact_x}
    it { should validate_numericality_of :noise_impact_x}
    it { should validate_presence_of :noise_impact_y}
    it { should validate_numericality_of :noise_impact_y}
    it { should validate_presence_of :noise_impact_z}
    it { should validate_numericality_of :noise_impact_z}
    it { should validate_presence_of :shape_height}
    it { should validate_numericality_of :shape_height}
    it { should validate_presence_of :rec_position_y}
    it { should validate_numericality_of :rec_position_y}
    it { should validate_presence_of :bloom_rotation_x}
    it { should validate_numericality_of :bloom_rotation_x}
    it { should validate_presence_of :bloom_rotation_y}
    it { should validate_numericality_of :bloom_rotation_y}
    it { should validate_presence_of :bloom_rotation_z}
    it { should validate_numericality_of :bloom_rotation_z}
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