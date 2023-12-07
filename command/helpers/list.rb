require_relative '../help'
require_relative '../create_game'
require_relative '../join_game'
require_relative '../start_game'
require_relative '../list_your_villages'
require_relative '../reset_game'
require_relative '../view_village'
require_relative '../list_all_villages'
require_relative '../view_resources'
require_relative '../construct_building'

module Command
  module Helpers
    LIST = [
      # Help.new,
      # CreateGame.new,
      # JoinGame.new,
      # StartGame.new,
      # ListYourVillages.new,
      # ResetGame.new,
      # ViewVillage.new,
      # ListAllVillages.new,
      # ViewResources.new,
      ConstructBuilding.new
    ]
  end
end
