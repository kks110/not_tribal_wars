require 'active_record'

class Village < ActiveRecord::Base

  belongs_to :game
  belongs_to :player
  has_many :buildings

  def wood_generated_per_minute(resource_generation)
    building = buildings.select{|building| building.building_type.name == 'Forest'}
    building.first.level * resource_generation.wood_per_level
  end

  def food_generated_per_minute(resource_generation)
    building = buildings.select{|building| building.building_type.name == 'Vegetable Patch'}
    building.first.level * resource_generation.food_per_level
  end

  def stone_generated_per_minute(resource_generation)
    building = buildings.select{|building| building.building_type.name == 'Mine'}
    building.first.level * resource_generation.stone_per_level
  end

end