class AddNoiseToPlants < ActiveRecord::Migration[7.1]
  def change
    add_column :plants, :noise_scale, :float
    add_column :plants, :noise_impact_x, :float
    add_column :plants, :noise_impact_y, :float
    add_column :plants, :noise_impact_z, :float
  end
end
