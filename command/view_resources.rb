require_relative './base'

module Command
  class ViewResources < Command::Base
    def name
      :view_resources
    end

    def description
      "View the resources you have available"
    end

    def execute(request:)
      response = ''
      player = Player.where(discord_id: request.event.user.id).first
      transactions = get_transactions(player)
      transactions.each do |transaction|
        response << transaction.resource_type.name
        resource_counter = 0
        player.villages.each do |village|
          resource_counter += case transaction.resource_type.name
                              when 'Wood'
                                village.wood_generated_per_minute(request.resource_generation)
                              when 'Stone'
                                village.stone_generated_per_minute(request.resource_generation)
                              when 'Food'
                                village.food_generated_per_minute(request.resource_generation)
                              end

          difference = (Time.now - transaction.updated_at).floor
          calculated_change = (difference / 60) * resource_counter
          total_resource = calculated_change + transaction.current_resource_total
          response << "  " + total_resource.to_s + "\n"
        end
      end

      request.event.respond(content: response, ephemeral: true)

      # rescue => e
      #   ErrorLog.logger.error("An Error occurred: Command name: #{name}. Error #{e}")
    end

    private

    def get_transactions(player)
      ResourceType.all.each_with_object([]) do |resource_type,array|
        array << Transaction.where(game_player_id: player.game_players.first.id, resource_type_id: resource_type.id).order(updated_at: :desc).first
      end
    end
  end
end
