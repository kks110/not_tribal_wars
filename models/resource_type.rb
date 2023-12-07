require 'active_record'

class ResourceType < ActiveRecord::Base

  has_many :transactions

end