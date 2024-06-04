class AddPositionToPlants < ActiveRecord::Migration[7.1]
  def change
    add_column :plants, :position, :string
  end
end
