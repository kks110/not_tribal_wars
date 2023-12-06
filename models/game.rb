require 'active_record'

class Game < ActiveRecord::Base
  has_many :game_players
end