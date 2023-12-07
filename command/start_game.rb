# frozen_string_literal: true

require_relative './base'

module Command
  class StartGame < Command::Base
    def name
      :start_game
    end

    def description
      "Start the game!"
    end

    def execute(request:)
      unless request.game
        request.event.respond(content: "You must create a game!", ephemeral: true)

        return
      end

      if request.game.started
        request.event.respond(content: "The game has already started!", ephemeral: true)

        return
      end

      request.game.update!(started: true)

      GamePlayer.where(game_id: request.game.id).each do |player|
        village = Village.create!(player_id: player.player_id,game_id: request.game.id)

        starting_building = BuildingType.where(name:"Vegetable Patch").first
        Building.create!(village_id: village.id, building_type_id: starting_building.id)
      end
      request.event.respond(content: "The game has begun! No tribes for you")
      # rescue => e
      #   ErrorLog.logger.error("An Error occurred: Command name: #{name}. Error #{e}")
    end
  end
end