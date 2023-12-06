require_relative '../../models/building_type'
class CreateBuildings < ActiveRecord::Migration[7.0]
  def change
    create_table :building_types do |t|
      t.string :name
    end

    create_table :buildings do |t|
      t.belongs_to :village
      t.references :building_type
      t.integer :building_level, default: 1
    end


    BuildingType.create(name: 'Mine')
    BuildingType.create(name: 'Forest')
    BuildingType.create(name: 'Wall')
    BuildingType.create(name: 'Barracks')
    BuildingType.create(name: 'Vegetable Patch')


  end

end