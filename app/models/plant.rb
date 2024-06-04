class Plant < ApplicationRecord
  has_many :user_plants, dependent: :destroy
  has_many :users, through: :user_plants

  # self.inheritance_column = :plant_type

  validates :name, presence: true
  validates :description, presence: true
  validates :plant_type, presence: true
  validates :lifespan, presence: true, numericality: true
  validates :planted, presence: true, numericality: true
  validates :phases, presence: true
  validates :position, presence: true

  validate :validate_phases_format

  private

  def validate_phases_format
    if phases.present? && !phases.is_a?(Hash)
      errors.add(:phases, "must be a valid JSON object")
    end
  end
end
