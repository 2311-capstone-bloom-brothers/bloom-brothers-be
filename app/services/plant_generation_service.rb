class PlantGenerationService
  def self.generate_plant(name, description, plant_type)
    response = Faraday.post('https://be-plant-microservce-b4648dce0143.herokuapp.com/generate_plant', {
      name: name,
      description: description,
      plant_type: plant_type
    }.to_json, 'Content-Type' => 'application/json')

    JSON.parse(response.body)
  end
end
