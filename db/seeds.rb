# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
UserPlant.destroy_all
User.destroy_all
Plant.destroy_all

User.create(email: "user1@example.com", password_digest: "password1", location: "New York")


# Create some plants
Plant.create(
  name: "Rose",
  description: "Beautiful flower with thorns",
  petals: 5,
  petal_color: "Red",
  petal_length: 2,
  petal_width: 1,
  petal_height: 3,
  stem_color: "Green",
  stem_length: 10,
  stem_width: 1,
  stem_height: 10,
  life_cycle: 2
)
Plant.create(
  name: "Sunflower",
  description: "Large flower that follows the sun",
  petals: 20,
  petal_color: "Yellow",
  petal_length: 4,
  petal_width: 4,
  petal_height: 4,
  stem_color: "Green",
  stem_length: 50,
  stem_width: 2,
  stem_height: 50,
  life_cycle: 1
)

# Associate plants with users
UserPlant.create(user_id: User.first.id, plant_id: Plant.first.id)
UserPlant.create(user_id: User.first.id, plant_id: Plant.last.id)