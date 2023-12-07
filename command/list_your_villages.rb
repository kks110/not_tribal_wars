# frozen_string_literal: true

require_relative './base'

module Command
  class ListYourVillages < Command::Base
    def name
      :list_your_villages
    end

    def description
      "Show all the villages you own in a list"
    end

    def execute(request:)
      player = Player.where(discord_id: request.event.user.id).first
      villages = Village.where(game_id: request.game.id, player_id: player.id)
      response = villages.map{|v| "Village name: #{v.id}"}.join(',')
      request.event.respond(content: response, ephemeral: true)
      # rescue => e
      #   ErrorLog.logger.error("An Error occurred: Command name: #{name}. Error #{e}")
    end
  end
end