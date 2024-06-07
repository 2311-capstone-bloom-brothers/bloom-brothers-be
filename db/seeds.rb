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

user = User.create(email: "user1@example.com", password_digest: "password1", location: "New York")


# Create some plants
plant_1_name = "Rose"
plant_1_description = "The Flower of Love"
plant_1_type = "flower1"
plant_1_position = "A1"

plant_1 = PlantGenerationService.generate_plant(plant_1_name, plant_1_description, plant_1_type, plant_1_position)

plant_2_name = "Sun Flower"
plant_2_description = "Bows down to no man or star"
plant_2_type = "flower2"
plant_2_position = "A4"

plant_2 = PlantGenerationService.generate_plant(plant_2_name, plant_2_description, plant_2_type, plant_2_position)

plant_1 = Plant.create!(plant_1)
plant_2 = Plant.create!(plant_2)

# Associate plants with users
UserPlant.create(user_id: user.id, plant_id: plant_1.id)
UserPlant.create(user_id: user.id, plant_id: plant_2.id)