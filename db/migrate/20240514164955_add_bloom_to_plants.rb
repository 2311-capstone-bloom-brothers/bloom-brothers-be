class AddBloomToPlants < ActiveRecord::Migration[7.1]
  def change
    add_column :plants, :bloom_rotation_x, :float
    add_column :plants, :bloom_rotation_y, :float
    add_column :plants, :bloom_rotation_z, :float
  end
end
