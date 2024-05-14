class PlantSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :petal_color, :radius_top, :radius_bottom, :radial_segments, :rec_radius, :noise_scale, :noise_impact_x, :noise_impact_y, :noise_impact_z, :shape_height, :rec_position_y, :bloom_rotation_x, :bloom_rotation_y, :bloom_rotation_z, :stem_width, :stem_height, :stem_color, :life_cycle
end
