require 'active_record'

class GamePlayer < ActiveRecord::Base

  belongs_to :game
  belongs_to :player
  has_many :transactions

end