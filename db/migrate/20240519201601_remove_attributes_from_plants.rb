class RemoveAttributesFromPlants < ActiveRecord::Migration[7.1]
  def change
    remove_column :plants, :petal_color, :string
    remove_column :plants, :stem_color, :string
    remove_column :plants, :life_cycle, :integer
    remove_column :plants, :radius_top, :float
    remove_column :plants, :radius_bottom, :float
    remove_column :plants, :radial_segments, :float
    remove_column :plants, :rec_radius, :float
    remove_column :plants, :noise_scale, :float
    remove_column :plants, :noise_impact_x, :float
    remove_column :plants, :noise_impact_y, :float
    remove_column :plants, :noise_impact_z, :float
    remove_column :plants, :shape_height, :float
    remove_column :plants, :stem_height, :float
    remove_column :plants, :stem_width, :float
    remove_column :plants, :rec_position_y, :float
    remove_column :plants, :bloom_rotation_x, :float
    remove_column :plants, :bloom_rotation_y, :float
    remove_column :plants, :bloom_rotation_z, :float
  end
end
