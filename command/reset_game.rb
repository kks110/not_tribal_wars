# frozen_string_literal: true

require_relative './base'

module Command
  class ResetGame < Command::Base
    def name
      :reset_game
    end

    def description
      "Reset game"
    end

    def execute(request:)

      models = [Game, GamePlayer,Village,Player,Building]

      models.each do |model|
        model.delete_all
      end

      request.event.respond(content: 'Successfully reset the game', ephemeral: true)

      # rescue => e
      #   ErrorLog.logger.error("An Error occurred: Command name: #{name}. Error #{e}")
    end
  end
end