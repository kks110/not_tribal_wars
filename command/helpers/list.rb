require_relative '../help'
require_relative '../create_game'
require_relative '../join_game'
require_relative '../start_game'
require_relative '../list_your_villages'
require_relative '../reset_game'
require_relative '../view_village'
require_relative '../list_all_villages'

module Command
  module Helpers
    LIST = [
      Help.new,
      CreateGame.new,
      JoinGame.new,
      StartGame.new,
      ListYourVillages.new,
      ResetGame.new,
      ViewVillage.new,
      ListAllVillages.new
    ]
  end
end
