class AddHeightAndWidthToPlants < ActiveRecord::Migration[7.1]
  def change
    add_column :plants, :shape_height, :float
    add_column :plants, :stem_height, :float
    add_column :plants, :stem_width, :float
    add_column :plants, :rec_position_y, :float
  end
end
