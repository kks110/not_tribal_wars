require 'active_record'

class Player < ActiveRecord::Base

  has_many :village

  validates :discord_id, :username, presence: true, uniqueness: true


end