class PlantSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :plant_type, :planted, :lifespan, :position, :phases
end
