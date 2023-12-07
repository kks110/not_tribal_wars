require 'active_record'

class Building < ActiveRecord::Base

  has_one :village
  belongs_to :building_type

end