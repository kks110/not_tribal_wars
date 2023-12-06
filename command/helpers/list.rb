require_relative '../help'
require_relative '../create_game'

module Command
  module Helpers
    LIST = [
      Help.new,
      CreateGame.new,
    ]
  end
end
