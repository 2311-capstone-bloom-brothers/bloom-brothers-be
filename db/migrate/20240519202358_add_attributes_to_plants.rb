class AddAttributesToPlants < ActiveRecord::Migration[7.1]
  def change
    add_column :plants, :type, :string
    add_column :plants, :lifespan, :bigint
    add_column :plants, :planted, :bigint
    add_column :plants, :phases, :jsonb
  end
end
