require_relative '../help'
require_relative '../create_game'
require_relative '../join_game'
require_relative '../start_game'
require_relative '../list_villages'
require_relative '../reset_game'
module Command
  module Helpers
    LIST = [
      Help.new,
      CreateGame.new,
      JoinGame.new,
      StartGame.new,
      ListVillages.new,
      ResetGame.new
    ]
  end
end
