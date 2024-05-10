class CreatePlants < ActiveRecord::Migration[7.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :description
      t.integer :petals
      t.string :petal_color
      t.integer :petal_length
      t.integer :petal_width
      t.integer :petal_height
      t.string :stem_color
      t.integer :stem_length
      t.integer :stem_width
      t.integer :stem_height
      t.integer :life_cycle

      t.timestamps
    end
  end
end
