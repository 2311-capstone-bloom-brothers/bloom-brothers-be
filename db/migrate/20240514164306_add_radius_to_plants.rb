class AddRadiusToPlants < ActiveRecord::Migration[7.1]
  def change
    add_column :plants, :radius_top, :float
    add_column :plants, :radius_bottom, :float
    add_column :plants, :radial_segments, :float
    add_column :plants, :rec_radius, :float
  end
end
