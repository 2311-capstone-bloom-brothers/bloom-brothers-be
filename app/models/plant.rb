class Plant < ApplicationRecord
  has_many :user_plants, dependent: :destroy
  has_many :users, through: :user_plants

  validates :name, presence: true
  validates :description, presence: true
  validates :petals, numericality: true, presence: true
  validates :petal_color, presence: true
  validates :petal_length, numericality: true, presence: true
  validates :petal_width, numericality: true, presence: true
  validates :petal_height, numericality: true, presence: true
  validates :stem_color, presence: true
  validates :stem_length, numericality: true, presence: true
  validates :stem_width, numericality: true, presence: true
  validates :stem_height, numericality: true, presence: true
  validates :life_cycle, presence: true
  enum life_cycle: ["seedling", "blooming", "thriving", "wilting", "dead"]
end
