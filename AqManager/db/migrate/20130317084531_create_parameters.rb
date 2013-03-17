class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.string :name
      t.string :units
      t.float :ocean_max
      t.float :ocean_norm
      t.float :ocean_min
      t.float :tank_max
      t.float :tank_optimum
      t.float :tank_min

      t.timestamps
    end
  end
end
