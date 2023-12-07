require 'active_record'

class BuildingType < ActiveRecord::Base

  has_many :buildings

end