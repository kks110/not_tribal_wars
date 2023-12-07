# frozen_string_literal: true

require_relative './base'

module Command
  class ListVillages < Command::Base
    def name
      :list_villages
    end

    def description
      "Show all the villages you own in a list"
    end

    def execute(request:)
      player = Player.where(discord_id: request.event.user.id).first
      villages = Village.where(game_id: request.game.id, player_id: player.id)
      request.event.respond(content: villages.map{|v| v.id}.join(','), ephemeral: true)
      # rescue => e
      #   ErrorLog.logger.error("An Error occurred: Command name: #{name}. Error #{e}")
    end
  end
end