require 'active_record'

class Transaction < ActiveRecord::Base

  has_one :game_player
  belongs_to :resource_types

end