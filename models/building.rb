require 'active_record'

class Building < ActiveRecord::Base

  has_one :building_type

end