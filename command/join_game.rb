# frozen_string_literal: true

require_relative './base'

module Command
  class JoinGame < Command::Base
    def name
      :join_game
    end

    def description
      "Join a game"
    end

    def execute(request:)
      if request.game.game_players.include?(request.event.user.id)

      end
      
      if request.game
        request.event.respond(content: "A game is already created for this server!", ephemeral: true)

        return
      end

      Game.create!(
        started: false, finished: false
      )

      response = "A game has been created. Register up!"

      request.event.respond(content: response)

      # rescue => e
      #   ErrorLog.logger.error("An Error occurred: Command name: #{name}. Error #{e}")
    end
  end
end