class RenameTypeToPlantType < ActiveRecord::Migration[7.1]
  def change
    rename_column :plants, :type, :plant_type
  end
end
