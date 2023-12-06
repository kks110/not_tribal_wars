require 'active_record'

class Player < ActiveRecord::Base

  has_many :villages
  has_many :game_players

  validates :discord_id, :username, presence: true, uniqueness: true


end