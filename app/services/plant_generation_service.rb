class PlantGenerationService
  def self.generate_plant(name, description, plant_type)
    response = Faraday.post('https://be-plant-microservce-2db5d13ea731.herokuapp.com/generate_plant') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = {
        name: name,
        description: description,
        plant_type: plant_type
      }.to_json
    end

    JSON.parse(response.body)
  end
end
