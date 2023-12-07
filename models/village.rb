require 'active_record'

class Village < ActiveRecord::Base

  belongs_to :game
  belongs_to :player
  has_many :buildings

end