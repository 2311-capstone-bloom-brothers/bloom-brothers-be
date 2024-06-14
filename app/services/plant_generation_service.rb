class PlantGenerationService
  def self.generate_plant(name, description, plant_type, position)
    # response = Faraday.post('https://be-plant-microservce-2db5d13ea731.herokuapp.com/generate_plant') do |req|
    response = Faraday.post('http://localhost:3001/generate_plant') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = {
        name: name,
        description: description,
        plant_type: plant_type,
        position: position
      }.to_json
    end

    JSON.parse(response.body)
  end
end
