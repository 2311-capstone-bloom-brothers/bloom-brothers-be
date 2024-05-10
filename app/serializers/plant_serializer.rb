class PlantSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :petals, :petal_color, :petal_length, :petal_width, :petal_height, :stem_length, :stem_width, :stem_height, :stem_color, :life_cycle
end
