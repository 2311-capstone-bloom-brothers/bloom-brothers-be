class RemovePetalsFromPlants < ActiveRecord::Migration[7.1]
  def change
    remove_column :plants, :petals, :integer
    remove_column :plants, :petal_length, :integer
    remove_column :plants, :petal_width, :integer
    remove_column :plants, :petal_height, :integer
  end
end
