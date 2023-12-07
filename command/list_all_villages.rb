# frozen_string_literal: true

require_relative './base'

module Command
  class ListAllVillages < Command::Base
    def name
      :list_all_villages
    end

    def description
      "Show all the villages in the game"
    end

    def execute(request:)
      villages = Village.where(game_id: request.game.id)
      response = villages.map{|v| "Village name: #{v.id}, Village Owner: #{v.player.username}"}.join(",\n")
      request.event.respond(content: response, ephemeral: true)
      # rescue => e
      #   ErrorLog.logger.error("An Error occurred: Command name: #{name}. Error #{e}")
    end
  end
end