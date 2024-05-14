class RemoveStemsFromPlants < ActiveRecord::Migration[7.1]
  def change
    remove_column :plants, :stem_length, :integer
    remove_column :plants, :stem_width, :integer
    remove_column :plants, :stem_height, :integer
  end
end
