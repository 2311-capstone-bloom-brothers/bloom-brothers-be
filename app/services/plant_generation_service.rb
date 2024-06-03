class PlantGenerationService
  def self.generate_plant(name, description, plant_type)
    response = Faraday.post('https://be-plant-microservce-b4648dce0143.herokuapp.com/') do |req|
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
