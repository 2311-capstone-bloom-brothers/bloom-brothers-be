class Plant < ApplicationRecord
  has_many :user_plants, dependent: :destroy
  has_many :users, through: :user_plants

  validates :name, presence: true
  validates :description, presence: true
  validates :petal_color, presence: true
  validates :stem_color, presence: true
  validates :radius_top, numericality: true, presence: true
  validates :radius_bottom, numericality: true, presence: true
  validates :radial_segments, numericality: true, presence: true
  validates :rec_radius, numericality: true, presence: true
  validates :noise_scale, numericality: true, presence: true
  validates :noise_impact_x, numericality: true, presence: true
  validates :noise_impact_y, numericality: true, presence: true
  validates :noise_impact_z, numericality: true, presence: true
  validates :shape_height, numericality: true, presence: true
  validates :rec_position_y, numericality: true, presence: true
  validates :bloom_rotation_x, numericality: true, presence: true
  validates :bloom_rotation_y, numericality: true, presence: true
  validates :bloom_rotation_z, numericality: true, presence: true
  validates :stem_width, numericality: true, presence: true
  validates :stem_height, numericality: true, presence: true
  validates :life_cycle, presence: true
  enum life_cycle: ["seedling", "blooming", "thriving", "wilting", "dead"]
end
