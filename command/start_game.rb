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

      GamePlayer.where(game_id: request.game.id).each do |game_player|
        village = Village.create!(player_id: game_player.player_id, game_id: request.game.id)
        ['Vegetable Patch', 'Mine', 'Forest'].each do |building|
          starting_building = BuildingType.where(name: building).first
          Building.create!(village_id: village.id, building_type_id: starting_building.id)
        end

        ResourceType.all.each do |resource|
          Transaction.create!(game_player_id: game_player.id, resource_type_id: resource.id, resource_change: 500, current_resource_total: 500)
        end

      end
      request.event.respond(content: "The game has begun! No tribes for you")
      # rescue => e
      #   ErrorLog.logger.error("An Error occurred: Command name: #{name}. Error #{e}")
    end
  end
end