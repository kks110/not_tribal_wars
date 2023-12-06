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
      player = if Player.where(discord_id: request.event.user.id).any?
        Player.where(
          discord_id: request.event.user.id
        ).first
               else
        Player.create!(
          discord_id: request.event.user.id,
          username: request.event.user.username
        )
      end

      game_player = GamePlayer.where(
        player_id: player.id,
        game_id: request.game.id
      )

      unless game_player.empty?
        request.event.respond(content: "You have already registered", ephemeral: true)

        return
      else
        GamePlayer.create!(
          player_id: player.id,
          game_id: request.game.id
        )
      end

      request.event.respond(content: "Thanks for joining!")

      # rescue => e
      #   ErrorLog.logger.error("An Error occurred: Command name: #{name}. Error #{e}")
    end
  end
end